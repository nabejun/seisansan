class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :sign_in?
  before_filter :require_sign_in

  private

  def current_user
    logger.debug("------------ ApplicationController#current_user -------------")
    logger.debug(@current_user)
    logger.debug("----------------------------")
    return @current_user if defined?(@current_user)
    @current_user ||= current_user_session && current_user_session.user 

  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def require_sign_in
    unless current_user
      redirect_to sign_in_url
      return false
    end
  end

  def require_sign_in
    current_user_session != nil
  end
end
