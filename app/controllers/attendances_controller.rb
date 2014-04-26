class AttendancesController < ApplicationController

  before_action :event_from_url_param
 
  def new 
    @attendance = Attendance.new
    @attendance.mytime = []
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.mytime = mytime_arr_to_str @attendance.mytime_arr
    @attendance.event_id = @event.id
    if @attendance.save
      redirect_to show_event_path(@url_param)
    else
      render :action => "new"
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    @attendance.mytime = mytime_arr_to_str attendance_params[:mytime_arr]
    if @attendance.update(attendance_params)
      redirect_to show_event_path(@url_param)
    else
      render :action => "new"
    end
  end

  private 

  def attendance_params
    params.require(:attendance).permit(:user_name, :comment, mytime_arr: [])
  end

end
