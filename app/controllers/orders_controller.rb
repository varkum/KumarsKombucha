class OrdersController < ApplicationController
  def index
    @current_batch = Batch.current
    @last_batch = Batch.previous
  end

  def new
    @order = Order.new
    @batch_is_finished = Batch.current.no_bottles_left?
  end

  def create
    order = Order.new(email: order_params[:email], quantity: order_params[:quantity], pickup_day: order_params[:pickup_day].downcase, comment: order_params[:comment], batch_id: Batch.current.id)
    if order.save!
      OrderMailer.with(order: order).order_email.deliver_later
      redirect_to order_complete_path(id: order.id)
    else
      render :index, alert: order.errors.first.full_message
    end
  end

  def complete
  end

  private 

  def order_params
    params.require(:order).permit(:email, :quantity, :comment, :pickup_day)
  end
end
