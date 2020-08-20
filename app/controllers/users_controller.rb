class UsersController < ApplicationController
 
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def answers
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :company)
  end


end
