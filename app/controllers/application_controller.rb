require 'BarService'

class ApplicationController < ActionController::API
   before_action :authenticate_request
   attr_reader :current_user

   def search
     bar_name = params[:bar_name]
     bar_service = BarService.new()
     @bars = bar_service.filtered({bar_name: bar_name})
     render json: @bars
   end


  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: "Not Authorized"}, status: 401 unless @current_user
  end



end
