class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    require_login "You must sign in to post on this topic."
    set_vars

    @post = Post.new
  end

  def edit
  end

  def create
    require_login "You must sign in to post on this topic."
    set_vars

    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.topic_id = @topic.id

    if @post.save
        redirect_to [@cat, @topic], notice: 'Post was successfully created.'
    else
        render action: 'new'
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vars
        @cat = Category.find(params[:category_id])
        @topic = Topic.find(params[:topic_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body, :topic_id, :user_id)
    end
end
