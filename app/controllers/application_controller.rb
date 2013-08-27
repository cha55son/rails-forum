class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?
    before_filter :authenticate_user!
    before_filter :authenticate_admin!
    skip_before_filter :authenticate_user!, if: :devise_controller?
    skip_before_filter :authenticate_admin!, if: :devise_controller?
    before_filter :is_admin?
    before_filter :check_admin_path

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :display_name) }
        end

        def authenticate_admin!
            if !is_admin?
                flash[:alert] = "You must be an administrator to continue."
                redirect_to root_path
            end
        end

        def is_admin?
            @is_admin = false
            if user_signed_in? and current_user.admin == true
                @is_admin = true
                return true
            end
            return false
        end

        def check_admin_path
            action_path = @_action_name
            first_token = action_path.split('_')[0]
            @is_admin_path = first_token == 'admin' ? true : false
        end
end
