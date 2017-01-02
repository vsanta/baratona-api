class UsersController < ApplicationController
  skip_before_action :authenticate_request


  def create
      @user = User.new(email: params[:email], name: params[:name], password: params[:password])
      if @user.save
          render json: :ok
      else
          render json: {errors: @user.errors.full_messages}, :status => 400
      end
  end

end
