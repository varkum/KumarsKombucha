class OrdersController < ApplicationController
  def index
    @batch_num = Batch.current.id
    @orders = Batch.current.orders
  end

  def new
    @order = Order.new
  end

  def create
  end

  private 

  def order_params
    params.require(:order).permit(:name, :quantity, :comment)
  end
end
