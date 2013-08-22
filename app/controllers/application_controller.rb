class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_filter :configure_permitted_parameters, if: :devise_controller?
    before_filter :is_admin?

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :display_name) }
        end

        # Must be logged in to continue
        def require_login(msg = nil)
            if !user_signed_in?
                flash.alert = msg or "An error occurred, try to login before continuing."
                redirect_to new_user_session_path 
                return false
            end
            return true
        end

        def is_admin?
            @is_admin = false
            if user_signed_in? and current_user.admin == true
                @is_admin = true
            end
        end
end
