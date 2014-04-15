class UsersController < ApplicationController
  before_action :event_from_url_params
  def new
    @user = User.new
    if @event.nil?
      redirect_to root_url # return root path without notice
    elsif
      @plans = Plan.where(event_id: @event)
      log @plans
    end
  end

  def create
    @user = User.new(user_params)
    @user.event_id = @event.id
    if @user.save
      attendances = attendance_params[:attendances]
      attendances.each do |p|
        at = Attendance.new(p) #, :user_id => @user.id)
        at.user_id = @user.id
        at.save!
      end
      redirect_to event_path(@url_param)
    else
      @plans = Plan.where(event_id: @event)
      render :action => "new"
    end
  end

  private 

  def user_params
    # params.require(:user).permit(:name, :comment)
    # params.require(:user).permit(:name, :comment, { :attendances => [:status] })
    params.require(:user).permit(:name, :comment)
  end

  def attendance_params
    params.permit(:attendances =>[:status, :plan_id])
  end

  def event_from_url_params
    @url_param = params[:url_param]
    @event = Event.find_by(url_param: @url_param)
    p "@@ event_id is #{@event.id}"
  end

end
