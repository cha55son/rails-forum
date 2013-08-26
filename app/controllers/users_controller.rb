class UsersController < ApplicationController
    skip_before_filter :authenticate_user!
    skip_before_filter :authenticate_admin!, if: @is_admin_path
    before_filter :set_controller

    def admin_index
        @all_admin_users = User.where(:admin => true)
        @all_non_admin_users = User.where(:admin => false)
        @non_admin_users = @all_non_admin_users.page(params[:page]).per(10)
    end

    def admin_edit
        type = params[:type]

        @user = User.find(params[:id])
        if type == 'promote'
            @user.admin = true
        elsif type == 'demote'
            @user.admin = false
        end

        if @user.save
            flash[:info] = "The user was updated."
            redirect_to admin_users_path
        else
            redirect_to admin_users_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private 
        def set_controller
            @controller = self
        end
end
