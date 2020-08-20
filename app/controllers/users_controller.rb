class UsersController < ApplicationController
 
  def index
    @users = User.search(params[:search])
    @common_emails = current_user.both_arrays(current_user.response_email, @users.map(&:email).flatten)
  end

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


  private

  def user_params
    params.require(:user).permit(:email, :name, :company, :search)
  end


end
