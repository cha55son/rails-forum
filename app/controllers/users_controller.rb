class UsersController < ApplicationController
    skip_before_filter :authenticate_user!
    skip_before_filter :authenticate_admin!

    def show
        @user = User.find(params[:id])
    end
end
