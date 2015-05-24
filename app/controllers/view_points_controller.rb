class ViewPointsController < ApplicationController
  before_action :set_view_point_and_topic, only: [
    :show, :edit, :update, :destroy, :move_higher, :move_lower]

  include Axis

  def index
    @topic = Topic.includes(view_points: [:topic]).find(params[:topic_id])
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
    create_view_point_and_topic
    notice = "New view point '#{@view_point.title}' was created."
    process_create(@view_point, notice)
  end

  def update
    notice = "The view point '#{@view_point.title}' was updated."
    process_update(@view_point, view_point_params, notice)
  end

  def destroy
    notice = "The view point '#{@view_point.title}' was destroyed."
    process_destroy(@view_point, notice)
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

  def create_view_point_and_topic
    params_with_topic_id = view_point_params.merge(topic_id: params[:topic_id])
    @view_point = ViewPoint.new(params_with_topic_id)
    @topic = @view_point.topic
  end

  def view_point_params
    params.require(:view_point).permit(:title)
  end
end
