class EventsController < ApplicationController

  def index
      @events = User.find_by_email(params[:email]).events
      render json: {events: @events}
  end


  def create
    begin
      date = params[:date].to_datetime
    rescue Exception
      return render json: {errors: ["date or time invalid!"]}, status: 400
    end

    @user = User.find_by_email(params[:email])
    @event = Event.new(name: params[:name],
                       description:params[:description],
                       date:date.to_datetime,
                       base_location:params[:base_location],user:@user)

    if @event.save
      render json: :ok
    else
      render json: {errors: @event.errors.full_messages}, status: 400
    end
  end


end
