require 'rails_helper'

RSpec.describe GooglePlaceApiController, type: :controller do

  let(:user) {User.create(name:"JesusmarLima", email:"jesusmarlima@gmail.com", password:"1234")}

  describe "responds to" do
    before(:example) do
      token = AuthenticateUser.call(user.email, "1234").result
      request.headers.merge!("authorization"  => token)
    end

    it "get, given correct parameters, should return a list of places" do
      get :search_by_text, params:{text_to_search: 'the double windsor, brooklyn'}
      expect(response.body.to_s.include?('The Double Windsor')).to be true
    end

  end

end
