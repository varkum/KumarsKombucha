class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    email = Email.new(email_params)
    if email.save
      OrderMailer.with(email: email).subscribe_email.deliver_later
      redirect_to subscribe_path
    else
      render :new, alert: email.errors.first.full_message
    end
  end

  def destroy
    email = Email.find(params[:id])
    email.destroy
    redirect_to unsubscribe_path
  end

  private

  def email_params
    params.require(:email).permit(:address)
  end
end
