# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
   before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)#登録したメールアドレスか確認する
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)#有効なパスワードか確認する→＆＆　退会しているか確認する
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_session_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  def after_sign_out_path_for(resource)
    root_path(current_user)
  end
end
