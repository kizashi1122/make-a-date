require 'securerandom'

class EventsController < ApplicationController

  include EventsHelper

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.url_param = SecureRandom.hex(16)
    @event.plan = event_plan_arr_to_str @event.plan_str.split(/\n/).map(&:strip)

    if @event.save
      render "url_show"
    else
      @event.url_param = ""
      render "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.plan += "\t" + event_plan_arr_to_str(event_params[:plan_str].split(/\n/).map(&:strip))
    if @event.update(event_params)
      redirect_to event_path(@event.url_param)
    else
      render "edit"
    end
  end


  def url_show
  end

  def show
    @event = Event.find_by(url_param: params[:id])
    if @event.nil?
      redirect_to root_url # return back root path without notice
    elsif
      @attendances = Attendance.where(event_id: @event.id)
    end
  end

  private 

  def event_params
    params.require(:event).permit(:name, :description, :plan_str)
  end

end
