class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  include AttendancesHelper

  def event_from_url_param
    @url_param = params[:url_param]
    @event = Event.find_by(url_param: @url_param)
    if @event.nil?
      redirect_to root_url # return root path without notice
    end
  end


end
