class EmailsController < ApplicationController
  def index
    @emails = Email.all
    if session[:user].nil?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      OrderMailer.with(email: @email).subscription_email.deliver_later
      redirect_to subscribe_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def unsubscribe
    @email = Email.find(params[:id])
  end

  def destroy
    email = Email.find(params[:id])
    email.destroy
    redirect_to unsubscribe_successful_path
  end

  private

  def email_params
    params.require(:email).permit(:address)
  end
end
