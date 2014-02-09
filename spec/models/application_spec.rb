require 'spec_helper'

describe Application do
  context "Associations" do
    it { should have_many(:machines).as_inverse_of(:applications).with_foreign_key(:application_ids) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context "Indexes" do
  	it { should have_index_for(_id: 1).with_options(unique: true) }
  	it { should have_index_for(name: 1).with_options(unique: true) }
  end

  context "Timestamps" do
  	it { should be_timestamped_document }
  end

  context "Fields" do
    it { should have_fields(:type, :_id) }
  end
end
