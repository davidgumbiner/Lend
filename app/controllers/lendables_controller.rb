class LendablesController < ApplicationController
  def new
    @lendable = Lendable.new
  end
  
  def create
    @lendable = Lendable.new(params[:lendable])
    @lendable.user_id = current_user.id
    if @lendable.save
      flash[:success] = "Lendable successfully created!"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end
  
  def update
      if @lendable.update_attributes(params[:lendable])
        flash[:success] = "Lendable updated"
        redirect_to @user
      else
        render 'edit'
      end
    end
end
