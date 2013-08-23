class RegistrationsController < Devise::RegistrationsController

protected
    def after_resending_confirmation_instructions_path_for(resource)
        logger.debug "[INFO] after_resending_confirmation_instructions_path_for"
        super
    end

    def after_sign_in_path_for(resource)
        logger.debug "[INFO] after_sign_in_path_for"
        super
    end

    def after_sign_up_path_for(resource)
        logger.debug "[info] after_sign_up_path_for"
        home_thanks_path
    end

    def after_update_path_for(resource)
        logger.debug "[info] after_update_path_for"
        super
    end

    def after_inactive_sign_up_path_for(resource)
        logger.debug "[info] after_inactive_sign_up_path_for"
        home_confirm_path
    end
end
