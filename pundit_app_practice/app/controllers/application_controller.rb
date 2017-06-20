class ApplicationController < ActionController::Base
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  
  private
  
    def user_not_authorized
      flash[:alert] = "Access Denied"
      redirect_to (request.referrer || root_path)
    end
end
