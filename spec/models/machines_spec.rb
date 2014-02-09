require 'spec_helper'

describe Machine do
  
  context "Associations" do
    it { should have_and_belong_to_many(:applications) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_uniqueness_of(:name) }
  end

  context "Indexes" do
  	it { should have_index_for(_id: 1).with_options(unique: true) }
    it { should have_index_for(application_ids: 1).with_options(background: true) }
  end

  context "Timestamps" do
  	it { should be_timestamped_document }
  end

  context "Fields" do
    it { should have_fields(:_id) }
  end
end