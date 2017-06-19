class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
    else
      @login = "You are not logged in!"
      redirect_to "/users/sign_in"
    end
  end
end
