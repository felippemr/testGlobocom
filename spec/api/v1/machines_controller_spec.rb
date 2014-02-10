require 'spec_helper'

describe "/api/v1/machines", :type => :api do
  
  let(:machine) { Fabricate(:machine)}

  context "creating a machine" do
    let(:url) { "/api/v1/machines" }

    it "sucessful JSON" do
      post url, machine: {
                           name: "0909009",
                           location: "SP-001-23",
                           application_ids: ["Linux", "Tsuru"]
                          }

      machine = Machine.where(name:"0909009").first

      last_response.status.should eql(200)
      
      last_response.body.should eql(machine.to_json)
    end
    
    it "unsuccessful JSON" do
      post url, machine: {
                           name: "",
                           location: "SP-001-23",
                           application_ids: ["Linux", "Tsuru"]
                          }
      errors = ["Name can't be blank"].to_json
      last_response.body.should eql(errors)
    end
  end

  context "show" do
    let(:url) { "/api/v1/machines/#{machine._id}"}

    it "JSON" do
      get url
      last_response.body.should eql(machine.to_json)
      last_response.status.should eql(200)
    end
  end

  context "updating a machine" do
    let(:url) { "/api/v1/machines/#{machine._id}"}

    it "returns a successful JSON" do
      patch url, machine: { 
                               name: "29090909",
                               location: "SP-001-24",
                               application_ids: ["CentOS", "OpenStack"]
                              }
      machine.reload.name.should eql("29090909")
      last_response.status.should eql(200)
      last_response.body.should eql("{\"head\":\"no_content\"}" )
    end
    
    it "returns a unsuccessful JSON" do
      patch url , machine: { 
                             name: ""
                            } 
      errors = ["Name can't be blank"].to_json
      last_response.body.should eql(errors)
    end
  end

  context "deleting a machine" do
    let(:url) { "/api/v1/machines/#{machine._id}" }
    it "JSON" do
      delete url
      last_response.status.should eql(200)
    end
  end
end