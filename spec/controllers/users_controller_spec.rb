require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "responds to" do

    it "responds to custom formats when provided in the params" do
      post :create, params: { :name => "Any Name", email:"anyemail@gmail.com", password: "1234"}
      expect(response).to have_http_status 200
    end

    it "status 400 after provided wrong parameters" do
      post :create, params: { :name => "Any Name", email:"anyemail@gmail.com"}
      expect(response).to have_http_status 400
    end

    it "erros list avalible after provided wrong parameters" do
      post :create, params: { :name => "Any Name", email:"anyemail@gmail.com"}
      expect(JSON.parse(response.body)["errors"]).to eq ["Password can't be blank"]
    end

  end
end
