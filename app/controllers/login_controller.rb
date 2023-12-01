class LoginController < ApplicationController
  def new
    if session[:user] == "Varun"
      redirect_to orders_path
    end
  end

  def create
    if params[:password] == Rails.application.credentials.admin.password
      session[:user] = "Varun"
      redirect_to orders_path
    else
      redirect_to root_path
    end
  end
end