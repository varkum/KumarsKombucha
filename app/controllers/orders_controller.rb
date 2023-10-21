class OrdersController < ApplicationController
  def index
    @current_batch = Batch.current
    @last_batch = Batch.previous
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new order_params
    if order.save
      redirect_to order_complete_path(order)
    else
      render :index, alert: order.errors.first.full_message
    end
  end

  def complete
  end

  private 

  def order_params
    params.require(:order).permit(:name, :quantity, :comment).with_defaults(batch_id: Batch.current.id)
  end
end
