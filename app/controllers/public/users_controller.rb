class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to user_path(@user)

  else
    render 'edit'
  end

  end

  def unsubscribe

  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def user_params
  	  params.require(:user).permit(:is_deleted, :name, :email, :password, :gender_id, :birthday, :image)
  end

  def ensure_correct_customer
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end
end
