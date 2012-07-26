class RequestsController < ApplicationController
  
  def new
    @request = Request.new
  end
  
  def create
    lendable = Lendable.find(params[:lendable_id])
  end
end
