require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "responds to" do

    it "Post, given correct params, should succeed" do
      post :create, params: { :name => "Any Name", email:"anyemail@gmail.com", password: "1234", password_confirmation: "1234"}
      expect(response).to have_http_status 200
    end

    it "Post, given wrong params number of params, status 400" do
      post :create, params: { :name => "Any Name", email:"anyemail@gmail.com"}
      expect(response).to have_http_status 400
    end

    it "Post, confirmation and passord does not match" do
      post :create, params: { :name => "Any Name", email:"anyemail@gmail.com", password: "1234", password_confirmation: "12346"}
      expect(JSON.parse(response.body)["errors"]).to eq ["Password confirmation doesn't match Password"]
    end

    it "erros list avalible after provided wrong parameters" do
      post :create, params: { :name => "Any Name", email:"anyemail@gmail.com"}
      expect(JSON.parse(response.body)["errors"]).to eq ["Password can't be blank"]
    end

  end
end
