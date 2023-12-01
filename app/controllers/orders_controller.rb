class OrdersController < ApplicationController
  def index
    if session[:user].nil?
      raise ActionController::RoutingError.new('Not Found')
    end
    @current_batch = Batch.current
    @bottles_left = Batch.current.bottles_left
    @unfulfilled_orders = Order.unfulfilled
  end

  def new
    @order = Order.new
    @batch_is_finished = Batch.current.no_bottles_left?
    @bottles_left = Batch.current.bottles_left
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
  
  def update
    order = Order.find(params[:id])
    order.update(status: order_params[:status])
    redirect_to orders_path
  end

  def complete
  end

  private 

  def order_params
    params.require(:order).permit(:email, :quantity, :comment, :pickup_day, :status)
  end
end
