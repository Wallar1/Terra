class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  helper_method :current_user, :user_signed_in?

  before_action :set_current_user_id

  def authenticate
    redirect_to '/welcome' unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    # converts current_user to a boolean by negating the negation
    !!current_user
  end

  def set_current_user_id
    User.current_id = session[:user_id]
  end
end
