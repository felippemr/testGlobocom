# Copyright (C) 2013 10gen Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'test_helper'

def insert_message(db, documents)
  documents = [documents] unless documents.is_a?(Array)
  message = ByteBuffer.new
  message.put_int(0)
  Mongo::BSON_CODER.serialize_cstr(message, "#{db.name}.test")
  documents.each { |doc| message.put_array(Mongo::BSON_CODER.new.serialize(doc, true).to_a) }
  message = db.add_message_headers(Mongo::Constants::OP_INSERT, message)
end

class DBTest < Test::Unit::TestCase
  context "DBTest: " do
    context "DB commands" do
      setup do
        @client = stub()
        @client.stubs(:write_concern).returns({})
        @client.stubs(:read).returns(:primary)
        @client.stubs(:tag_sets)
        @client.stubs(:acceptable_latency)
        @db = DB.new("testing", @client)
        @db.stubs(:safe)
        @db.stubs(:read)
        @db.stubs(:tag_sets)
        @db.stubs(:acceptable_latency)
        @collection = mock()
        @db.stubs(:system_command_collection).returns(@collection)
      end

      should "raise an error if given a hash with more than one key" do
        if RUBY_VERSION < '1.9'
          assert_raise MongoArgumentError do
            @db.command(:buildinfo => 1, :somekey => 1)
          end
        end
      end

      should "raise an error if the selector is omitted" do
        assert_raise MongoArgumentError do
          @db.command({}, :check_response => true)
        end
      end

      should "create the proper cursor" do
        @cursor = mock(:next_document => {"ok" => 1})
        Cursor.expects(:new).with(@collection,
          :limit => -1, :selector => {:buildinfo => 1},
          :socket => nil, :read => nil, :comment => nil).returns(@cursor)
        command = {:buildinfo => 1}
        @db.command(command, :check_response => true)
      end

      should "raise an error when the command fails" do
        @cursor = mock(:next_document => {"ok" => 0})
        Cursor.expects(:new).with(@collection,
          :limit => -1, :selector => {:buildinfo => 1},
          :socket => nil, :read => nil, :comment => nil).returns(@cursor)
        assert_raise OperationFailure do
          command = {:buildinfo => 1}
          @db.command(command, :check_response => true)
        end
      end

      should "pass on the comment" do
        @cursor = mock(:next_document => {"ok" => 0})
        Cursor.expects(:new).with(@collection,
          :limit => -1, :selector => {:buildinfo => 1},
          :socket => nil, :read => nil, :comment => "my comment").returns(@cursor)
        assert_raise OperationFailure do
          command = {:buildinfo => 1}
          @db.command(command, :check_response => true, :comment => 'my comment')
        end
      end

      should "raise an error if logging out fails" do
        @db.expects(:command).returns({})
        @client.expects(:auths).returns([])
        assert_raise Mongo::MongoDBError do
          @db.logout
        end
      end

      should "raise an error if collection creation fails" do
        @db.expects(:command).returns({'ok' => 0})
        assert_raise Mongo::MongoDBError do
          @db.create_collection("foo")
        end
      end

      should "raise an error if getlasterror fails" do
        @db.expects(:command).returns({})
        assert_raise Mongo::MongoDBError do
          @db.get_last_error
        end
      end

      should "raise an error if drop_index fails" do
        @db.expects(:command).returns({})
        assert_raise Mongo::MongoDBError do
          @db.drop_index("foo", "bar")
        end
      end

      should "raise an error if set_profiling_level fails" do
        @db.expects(:command).returns({})
        assert_raise Mongo::MongoDBError do
          @db.profiling_level = :slow_only
        end
      end
    end
  end
end
