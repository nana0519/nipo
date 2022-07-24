# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :end_user_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

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

  def end_user_state
    @end_user = EndUser.find_by(name: params[:end_user][:name])
    if @end_user.valid_password?(params[:end_user][:password]) && (@end_user.retirement == true)
      redirect_to new_end_user_session_path
      flash[:alert] = "退職済みのためログインできません"
    end
  end

end
