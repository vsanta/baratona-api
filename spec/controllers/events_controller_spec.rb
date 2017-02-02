require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  let(:user) {User.create(name:"JesusmarLima", email:"jesusmarlima@gmail.com", password:"1234")}

  describe "responds to" do
    before(:example) do
      token = AuthenticateUser.call(user.email, "1234").result
      request.headers.merge!("authorization"  => token)
    end

    it "returns all events from user" do
      get :index, params: {email:"jesusmarlima@gmail.com"}
      expect(response).to have_http_status 200
    end

    it "Post, given correct parameters, should succeed" do

      post :create, params: { name: "Jesusmar's Birthday",
        description: "Come join me to My brirthay barathon!!",
        date:"01/01/2012 23:59:00",
        base_location:"the double windsor",email:user.email}
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
          base_location:"the double windsor",email:user.email}
            expect(response).to have_http_status 400
    end
  end

  describe "responds to" do
    it "Post, without authenticate, status 401" do
      post :create, params: { name: "Jesusmar's Birthday",
        description: "Come join me to My brirthay barathon!!",
        date:"01/01/2012 23:59:00",
        base_location:"the double windsor",email:user.email}
        expect(response).to have_http_status 401
    end
  end

  # xdescribe "responds to" do
  #   let(:event_1){Event.create(name: "Jesusmar's Birthday",
  #     description: "Come join me to My brirthay barathon!!",
  #     date:"01/01/2012 23:59:00",
  #     base_location:"the double windsor",user_id:user.id)}
  #   let(:event_2){Event.create(name: "Vanessa's Birthday",
  #       description: "Come join me to My brirthay barathon!!",
  #       date:"01/01/2015 23:59:00",
  #       base_location:"Boto Bar",user_id:user.id)}
  #
  #
  #   before(:example) do
  #     token = AuthenticateUser.call(user.email, "1234").result
  #     request.headers.merge!("authorization"  => token)
  #   end
  #
  #   xit "given an user, should return all his events" do
  #     user.events.push(event_1)
  #     user.events.push(event_2)
  #     get :user_events
  #     expect(response).to_not be_empty
  #   end
  # end

end
