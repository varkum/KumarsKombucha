class BatchesController < ApplicationController
  def new
    @batch = Batch.new
  end
  
  def create
  end
  
  private
  
  def batch_params
    params.require(:batch).permit(:bottles, :pickup_days)
  end
  
end