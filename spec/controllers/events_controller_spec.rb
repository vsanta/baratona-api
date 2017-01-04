require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "responds to" do
    let(:user) {User.new(name:"JesusmarLima", email:"jesusmarlima@gmail.com", password:"1234")}

    before(:example) do
      user.save
      token = AuthenticateUser.call(user.email, "1234").result
      request.headers.merge!("authorization"  => token)
    end

    it "Post, given correct parameters, should succeed" do

      post :create, params: { name: "Jesusmar's Birthday",
        description: "Come join me to My brirthay barathon!!",
        date:"01/01/2012 23:59:00",
        base_location:"the double windsor",user_id:user.id}
        expect(response).to have_http_status 200
    end

    it "Post, without name parameter required, status 400" do
        post :create, params: {description:"Come join me to My brirthay barathon!!", date:"01/01/2012 23:59:59", base_location:"the double windsor"}
        expect(response).to have_http_status 400
    end

    it "Post, given invalid datetime, status 400" do
        post :create, params: { name: "Jesusmar's Birthday",
          description: "Come join me to My brirthay barathon!!",
          date:"45/45/2012 23:59:00",
          base_location:"the double windsor",user_id:user.id}
            expect(response).to have_http_status 400
    end
  end

  describe "responds to" do
    let(:user) {User.new(name:"JesusmarLima", email:"jesusmarlima@gmail.com", password:"1234")}

    before(:example) do
      user.save
    end

    it "Post, without authenticate, status 401" do
      post :create, params: { name: "Jesusmar's Birthday",
        description: "Come join me to My brirthay barathon!!",
        date:"01/01/2012 23:59:00",
        base_location:"the double windsor",user_id:user.id}
        expect(response).to have_http_status 401
    end
  end
end
