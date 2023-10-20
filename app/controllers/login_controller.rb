class LoginController < ApplicationController
  def new
  end

  def create
    if params[:answer1] == "Mazda 6" && params[:answer2] == "Andrew Johnston"
      session[:user] = "Varun"
      redirect_to orders_path
    else
      redirect_to root_path
    end
  end
end