class ViewPointsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @view_points = @topic.view_points
  end

  def new
    @view_point = ViewPoint.new(topic_id: params[:topic_id])
    @topic = @view_point.topic
  end

  def create
    @view_point = ViewPoint.new(view_point_params.merge({topic_id: params[:topic_id]}))
    @topic = @view_point.topic

    respond_to do |format|
      if @view_point.save
        format.html { redirect_to topic_view_points_path(@topic), notice: 'ViewPoint was successfully created.' }
        format.json { render :show, status: :created, location: @view_point }
      else
        format.html { render :new }
        format.json { render json: @view_point.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def view_point_params
    params.require(:view_point).permit(:title, :order)
  end
end
