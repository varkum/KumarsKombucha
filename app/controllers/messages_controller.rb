class MessagesController < ApplicationController
  def order_complete
    @pickup_day = Order.find(params[:id]).pickup_day
  end
  
  def subscribe
  end

  def unsubscribe
  end
end