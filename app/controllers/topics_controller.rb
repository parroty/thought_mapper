class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        notice = "Topic was successfully created."
        format.html { redirect_to @topic, notice: notice }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        notice = "Topic was successfully updated."
        format.html { redirect_to @topic, notice: notice }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      notice = "Topic was successfully destroyed."
      format.html { redirect_to topics_url, notice: notice }
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description, :comment)
  end
end
