class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      flash[:customer_updated_error] = "会員情報が正常に保存されませんでした。"
      redirect_to admin_user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:is_deleted)
  end
end
