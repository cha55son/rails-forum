class HomeController < ApplicationController
    skip_before_filter :authenticate_user!
    skip_before_filter :authenticate_admin!

    def index

    end

    def confirm

    end

    def thanks

    end
end
