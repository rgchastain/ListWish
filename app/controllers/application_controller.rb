class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def convert_time(datetime)
    time = Time.parse(datetime).in_time_zone("Pacific Time (US & Canada)")
    time.strftime("%-d/%-m/%y: %H:%M %Z")
  end

  private
	def require_login
		redirect_to '/login' if current_user == nil
	end
end
