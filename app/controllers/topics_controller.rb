class TopicsController < ApplicationController
  def index
    @cat = Category.find(params[:category_id])
    @topics = @cat.topics.all
  end

  def show
      @cat = Category.find(params[:category_id])
      @topic = @cat.topics.find(params[:id])
  end

  def new
    @cat = Category.find(params[:category_id])
    @topic = Topic.new
  end

  def edit
      @cat = Category.find(params[:category_id])
      @topic = @cat.topics.find(params[:id])
  end

  def create
    @cat = Category.find(params[:category_id])
    @topic = @cat.topics.build(topic_params)

    if @topic.save
        redirect_to [@cat, @topic], notice: 'Topic was successfully created.'
    else
        render action: 'new'
    end
  end

  def update
    @cat = Category.find(params[:category_id])
    @topic = @cat.topics.find(params[:id])
    if @topic.update(topic_params)
        redirect_to [@cat, @topic], notice: 'Topic was successfully updated.'
    else
        render action: 'edit'
    end
  end

  def destroy
    @cat = Category.find(params[:category_id])
    @topic = @cat.topics.find(params[:id])
    @topic.destroy
    redirect_to @cat
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :body)
    end
end
