require 'spec_helper'

describe "/api/v1/applications", :type => :api do
  
  let(:application) { Fabricate(:application)}
                
  context "creating a application" do
    
    let(:url) { "/api/v1/applications" }

    api_key = ApiKey.create
    
    it "sucessful JSON" do
      post url, application: {
                               name: "Linux",
                               type: "OS"
                             }
      application = Application.where(name:"Linux").first

      last_response.status.should eql(200)
      
      last_response.body.should eql(application.to_json)
    end
    
    it "unsuccessful JSON" do
      post url, application: { type: ""}
      errors = ["Name can't be blank"].to_json
      last_response.body.should eql(errors)
    end
  end

  context "show" do
    let(:url) { "/api/v1/applications/#{application._id}"}

    it "JSON" do
      get url
      last_response.body.should eql(application.to_json)
      last_response.status.should eql(200)
    end
  end

  context "updating a application" do
    let(:url) { "/api/v1/applications/#{application._id}"}

    it "returns a successful JSON" do
      patch url, application: { 
                               name: "Gimp",
                               type: "Tool"
                              }
      application.reload.name.should eql("Gimp")
      last_response.status.should eql(200)
      last_response.body.should eql("{\"head\":\"no_content\"}" )
    end
    
    it "returns a unsuccessful JSON" do
      patch url , application: { 
                                 name: ""
                               } 
      errors = ["Name can't be blank"].to_json
      last_response.body.should eql(errors)
    end
  end

  context "deleting a application" do
    let(:url) { "/api/v1/applications/#{application._id}" }
    it "JSON" do
      delete url
      last_response.status.should eql(200)
    end
  end
end