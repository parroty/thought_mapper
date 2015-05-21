class ViewPointsController < ApplicationController
  before_action :set_view_point_and_topic, only: [
    :show, :edit, :update, :destroy, :move_higher, :move_lower]

  def index
    @topic = Topic.find(params[:topic_id])
    @view_points = @topic.view_points
  end

  def show
  end

  def new
    @view_point = ViewPoint.new(topic_id: params[:topic_id])
    @topic = @view_point.topic
  end

  def edit
  end

  def create
    @view_point = create_view_point
    @topic = @view_point.topic

    respond_to do |format|
      if @view_point.save
        path   = topic_path(@view_point.topic)
        notice = "New view point '#{@view_point.title}' was successfully created."
        format.html { redirect_to path, notice: notice }
      else
        format.html { render :new, topic_id: @view_point.topic.id }
      end
    end
  end

  def update
    respond_to do |format|
      if @view_point.update(view_point_params)
        path   = topic_path(@topic)
        notice = "The view point '#{@view_point.title}' was successfully updated."
        format.html { redirect_to path, notice: notice }
      else
        format.html { render :edit, topic_id: @view_point.topic.id }
      end
    end
  end

  def destroy
    @view_point.destroy
    respond_to do |format|
      path   = topic_path(@topic)
      notice = "The view point '#{@view_point.title}' was successfully destroyed."
      format.html { redirect_to(path, notice: notice) }
    end
  end

  def move_higher
    @view_point.move_higher
    redirect_to topic_path(@topic)
  end

  def move_lower
    @view_point.move_lower
    redirect_to topic_path(@topic)
  end

  private

  def set_view_point_and_topic
    @view_point = ViewPoint.find(params[:id])
    @topic = @view_point.topic
  end

  def create_view_point
    params_with_topic_id = view_point_params.merge(topic_id: params[:topic_id])
    ViewPoint.new(params_with_topic_id)
  end

  def view_point_params
    params.require(:view_point).permit(:title)
  end
end
