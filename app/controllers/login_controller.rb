class LoginController < ApplicationController
  def new
  end

  def create
    if answer1 == "Mazda 6" && answer2 == "Andrew Johnston"
      session[:user] = "Varun"
      redirect_to admin_page
    else
      redirect_to root_path
    end
  end

  private
  
  def login_params
    params.permit(:email, :password)
  end
end