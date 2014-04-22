class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include AttendancesHelper

  def log arg
    p "@" * 20
    p arg
    p "@" * 20
  end

end
