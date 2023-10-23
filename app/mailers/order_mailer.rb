class OrderMailer < ApplicationMailer
  default from: email_address_with_name('varkum@outlook.com', 'Kumars Kombucha')

  def subscription_email
    @email = params[:email]
    mail(to: @email.address, subject: "You've Subscribed to Kumars Kombucha")
  end

  def order_email
    @order = params[:order]
    mail(to: @order.email, subject: "Your Kumar's Kombucha Order")
  end
end
