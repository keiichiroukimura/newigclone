class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_current_user
  #before_action :login_required
  
  private
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def login_required
    redirect_to new_session_path unless @current_user
  end
end
