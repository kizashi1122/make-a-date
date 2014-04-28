require 'securerandom'

class EventsController < ApplicationController

  include EventsHelper

  before_action :event_from_url_param, only: [:edit, :update, :show]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.url_param = SecureRandom.hex(16) ## TODO: check whether already stored in database
    @event.plan = event_plan_arr_to_str @event.plan_str.split(/\n/).map(&:strip)

    if @event.save
      render "url_show"
    else
      @event.url_param = ""
      render "new"
    end
  end

  def edit
  end

  def update
    # @event.plan << "\t" + event_plan_arr_to_str(event_params[:plan_str].split(/\n/).map(&:strip))
    @event.plan += "\t" + event_plan_arr_to_str(event_params[:plan_str].split(/\n/).map(&:strip))
    if @event.update(event_params)
      redirect_to show_event_path(@event.url_param)
    else
      render "edit"
    end
  end

  def url_show
  end

  def show
      @attendances = Attendance.where(event_id: @event.id)
  end

  private 

  def event_params
    params.require(:event).permit(:name, :description, :plan_str)
  end

end
