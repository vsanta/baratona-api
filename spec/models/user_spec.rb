require 'rails_helper'

RSpec.describe User, type: :model do


  let(:user) {User.new(name:"JesusmarLima", email:"jesusmarlima@gmail.com", password:"1234")}
  let(:event_1) {Event.new(name:"Jesusmar's Birthday", description:"Come join me to My brirthay barathon!!", date:DateTime.new, base_location:"the double windsor" ) }
  let(:event_2) {Event.new(name:"Vanessa's Birthday", description:"Come join me to My brirthay barathon!!", date:DateTime.new, base_location:"Botto Bar" ) }

  describe 'initialize user' do

    before(:example) do
      user.events.push(event_1)
      user.events.push(event_2)
    end

    it "User name should be JesusmarLima" do
      expect(user.name).to eq "JesusmarLima"
    end

    it "User have to have two Events" do
      expect(user.events.length).to be 2
    end

  end
end
