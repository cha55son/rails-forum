class TopicsController < ApplicationController
    skip_before_filter :authenticate_user!,     :only => [:show]
    skip_before_filter :authenticate_admin!,    :except => [:destroy]
    before_filter :set_cat
    before_filter :authenticate_owner?, :only => [:edit, :update]
    before_filter :is_owner?,           :only => [:show]

    def index
        @topics = Topic.all
    end

    def show
        set_topic
        @user = User.find(@topic.user_id)
        @all_posts = @topic.posts.order('created_at')
        @posts = @all_posts.page(params[:page]).per(10)
    end

    def new
        @topic = Topic.new
    end

    def edit
        set_topic
    end

    def create
        @topic = Topic.new(topic_params)
        @topic.user_id = current_user.id
        @topic.category_id = @cat.id

        if @topic.save
            redirect_to [@cat, @topic], notice: 'Topic was successfully created.'
        else
            render action: 'new'
        end
    end

    def update
        set_topic
        if @topic.update(topic_params)
            redirect_to [@cat, @topic], notice: 'Topic was successfully updated.'
        else
            render action: 'edit'
        end
    end

    def destroy
        set_topic
        @topic.destroy
        redirect_to @cat
    end

    private
        def is_owner?
            set_cat
            set_topic
            @is_owner = false
            if user_signed_in? and current_user.id == @topic.user_id
                @is_owner = true
                return true
            end
            return false
        end

        def authenticate_owner?
            if !is_owner?
                redirect_to [@cat, @topic], alert: "You must be the owner of the topic to continue."
            end
        end

        def set_topic
            if !@topic
                @topic = Topic.find(params[:id])
            end
        end

        def set_cat
            if !@cat
                @cat = Category.find(params[:category_id])
            end
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def topic_params
            params.require(:topic).permit(:title, :body)
        end
end
