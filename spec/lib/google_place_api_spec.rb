require "rails_helper"

describe "google_place_api" do

  describe 'api tests' do
    it 'returns api key' do
      expect(GooglePlaceApi.get_Key).to_not be_nil
    end

    it 'returns some JSON' do
      result = GooglePlaceApi.get_sample
      expect(result).to_not be_nil
    end

  end

  describe 'bussiness tests' do

   let(:base_bar){GooglePlaceApi.search_by_text("The Double Windsor").first}

   it "returns parsed objects and the name of first one should be 'The double windsor' " do
     expect(base_bar.name).to eq "The Double Windsor"
   end

   it 'passing locations should returns bars until 1000 meters of distance' do
     location = "#{base_bar.geometry['location']['lat']},#{base_bar.geometry['location']['lng']}"
     bars = GooglePlaceApi.search_by_radius(location,"1000")
     expect(bars.find{|bar| bar.name == "Greenwood Park"}).not_to be_nil
   end

  end


end
