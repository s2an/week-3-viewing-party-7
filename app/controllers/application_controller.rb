class ApplicationController < ActionController::Base
  helper_method :current_user, :current_location

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_location
    cookies[:location]
  end
end
