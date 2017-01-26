require 'google_place_api'

class GooglePlaceApiController < ApplicationController


 def search_by_text
   text_to_search = params[:text_to_search]
   result = GooglePlaceApi.search_by_text(text_to_search)
   render json: {bars:result}
 end

end
