# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: %i[create]
    # before_action :configure_account_update_params, only: [:update]
    skip_before_action :verify_authenticity_token, only: :destroy

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    def create
      if verify_recaptcha
        super
      else
        render :new
      end
    end

    # GET /resource/edit
    # def edit
    #   super
    #   @user = current_user
    # end

    # PUT /resource
    # def update
    #   super
    #   @user = current_user
    #   render 'edit' if @user.update(user_params)
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name nickname])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name nickname])
    end

    def after_update_path_for(resource)
      user_path(resource)
    end
    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
