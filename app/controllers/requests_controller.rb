class RequestsController < ApplicationController

  def create
    @request = Request.new(requester_id: current_user.id, lendable_id: params[:lendable_id])
    if @request.save
      redirect_to user_path(current_user)
    else
    end
  end
  
  def delete
    Request.delete(requester_id: current_user.id, lendable_id: params[:lendable_id])
  end
end
