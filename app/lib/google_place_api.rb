require 'open-uri'

module GooglePlaceApi

  def self.get_Key
     return ENV["google_place_api_key"]
  end

  def self.get_sample
    place_url="https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + "pizza in new york"+ "&key="+ get_Key
    body = open(place_url).read
  end

  def self.search_by_text(text_to_search)
    place_url="https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + text_to_search + "&key="+ get_Key
    body = open(place_url).read
    parse(body)
  end

  def self.search_by_radius(location,radius)
    radius_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+ location +"&radius=" + radius + "&types=bar&key="+ get_Key
    body = open(radius_url).read
    parse(body)
  end


  def self.parse(body)
      bars = []
      begin
        JSON.parse(body)["results"].each do |item|
          bar = Bar.new(
          formatted_address: item["formatted_address"],
          geometry: item["geometry"],
          icon: item["icon"],
          id: item['id'],
          name: item["name"],
          types: item["types"])
          bars << bar
        end
      rescue
        return []
      end
      bars
  end
end
