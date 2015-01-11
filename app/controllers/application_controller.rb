class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include PublicActivity::StoreController

	around_filter :user_time_zone, if: :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

  helper_method :current_user
end
