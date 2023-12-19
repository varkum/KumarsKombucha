class BatchesController < ApplicationController
  def new
    @batch = Batch.new
  end
  
  def create
    @batch = Batch.new(batch_params)
    if @batch.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def batch_params
    params.require(:batch).permit(:bottles, pickup_days: [])
  end
end