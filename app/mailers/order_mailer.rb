class OrderMailer < ApplicationMailer
  default from: 'varun.kumar@hey.com'

  def subscription_email
    @email = params[:email]
    mail(to: @email.address, subject: "You've subscribed to Kumars Kombucha")
  end

  def order_email
    @order = params[:order]
    mail(to: @order.email, subject: "Your Kumar's Kombucha Order")
  end
end
