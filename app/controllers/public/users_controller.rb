class Public::UsersController < ApplicationController
  before_action :guest_user_check, only: [:edit, :update, :withdraw,:confirm,:unsubscribe]
  before_action :ensure_correct_user,only: [:index,:show,:edit,:update,:withdraw,:confirm,:unsubscribe]

  def index
    @users = User.all.where(is_deleted: false).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @books = @user.books.where(is_draft: false).order(created_at: :desc).page(params[:page]).per(9)
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

  def confirm
    @user = User.find(params[:id])
    @books = @user.books.where(is_draft: true).order('created_at DESC')
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

  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end

  def guest_user_check
    redirect_to root_path, notice: "許可されていない操作です" if current_user.email == "example@guest.com"
    # if current_user.email == "aaa@aaa.com"
      # flash[:notice] ="許可されていない操作です"
    # end
  end
end
