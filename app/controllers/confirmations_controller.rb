class ConfirmationsController < Devise::ConfirmationsController

protected
    def after_confirmation_path_for(resource_name, resource)
        logger.debug "[info] after_confirmation_path_for"
        home_thanks_path
    end
end
