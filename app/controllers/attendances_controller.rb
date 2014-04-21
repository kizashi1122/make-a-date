class AttendancesController < ApplicationController
  
  before_action :event_from_url_params

  def new
    @attendance = Attendance.new
    if @event.nil?
      redirect_to root_url # return root path without notice
    end
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.mytime = @attendance.mytime_arr.join("\t")
    @attendance.event_id = @event.id
    
    if @attendance.save
      redirect_to event_path(@url_param)
    else
      render :action => "new"
    end
  end

  private 

  def attendance_params
    params.require(:attendance).permit(:user_name, :comment, mytime_arr: [])
  end

 def event_from_url_params
    @url_param = params[:url_param]
    @event = Event.find_by(url_param: @url_param)
    p "@@ event_id is #{@event.id}"
  end

end
