class CategoriesController < ApplicationController
    skip_before_filter :authenticate_user!, :only => [:index, :show]
    skip_before_filter :authenticate_admin!, :only => [:index, :show]

    def index
        @cats = Category.all
    end

    def new
        @cat = Category.new
    end

    def create
        @cat = Category.new(category_permit)
        if @cat.save
            redirect_to @cat
        else
            render 'new'
        end
    end

    def show
        @cat = Category.find(params[:id])
        @all_topics = @cat.topics.order('created_at')
        @topics = @all_topics.page(params[:page]).per(2)
    end

    def edit
        @cat = Category.find(params[:id])
    end 

    def update
        @cat = Category.find(params[:id])
        if @cat.update(category_permit)
            redirect_to @cat
        else
            render 'edit'
        end
    end

    def destroy
        @cat = Category.find(params[:id])
        @cat.destroy

        redirect_to categories_path
    end

    private

    def category_permit
        params[:category].permit(:title, :description)
    end
end
