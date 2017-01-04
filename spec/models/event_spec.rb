require 'rails_helper'

RSpec.describe Event, type: :model do


  let(:event) {Event.new(name:"Jesusmar's Birthday", description:"Come join me to My brirthay barathon!!", date:DateTime.new, base_location:"the double windsor" ) }
  let(:user) {User.new(name:"JesusmarLima", email:"jesusmarlima@gmail.com", password:"1234")}


  describe 'initialize event' do
    it "Event name should be Jesusmar's Birthday" do
      expect(event.name).to eq "Jesusmar's Birthday"
    end

  end

  before(:example) do
    user.events.push(event)
  end

  describe 'test associations' do

    it 'Event Owner should be JesusmarLima' do
      expect(event.user.name).to eq 'JesusmarLima'
    end

    it 'User should have at least one Event' do
      expect(user.events.length).to be > 0
    end

  end

end
