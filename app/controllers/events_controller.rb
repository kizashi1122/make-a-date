require 'securerandom'

class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.url_param = SecureRandom.hex(16)

    plan_str = @event.plan_str

    if @event.save
      plan_str.each_line { |line|
        unless line.blank?
          pl = Plan.new(datetime: line.strip, event: @event) # TODO error handling
          pl.save!
        end
      }
      render "url_show"
    else
      @event.url_param = ""
      render "new"
    end
  end

  def url_show
  end

  def show
    @event = Event.find_by(url_param: params[:id])
    if @event.nil?
      redirect_to root_url # return back root path without notice
    elsif
      @plans = Plan.where(event_id: @event)
      @users = User.includes(:attendances).where(event_id: @event.id)
    end
  end

  private 

  def event_params
    params.require(:event).permit(:name, :description, :plan_str)
  end

end
