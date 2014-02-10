require 'spec_helper'

describe ApiKey do
  context "Fields" do
    it { should have_fields(:access_token) }
  end

  context "Timestamps" do
  	it { should be_timestamped_document }
  end
end
