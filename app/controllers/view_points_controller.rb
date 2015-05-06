class ViewPointsController < ApplicationController
  before_action :set_view_point_and_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topic = Topic.find(params[:topic_id])
    @view_points = @topic.view_points
  end

  def new
    @view_point = ViewPoint.new(topic_id: params[:topic_id])
    @topic = @view_point.topic
  end

  def edit
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

  def update
    respond_to do |format|
      if @view_point.update(view_point_params)
        format.html { redirect_to topic_view_points_path(@topic), notice: 'Topic was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @view_point.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @view_point.destroy
    respond_to do |format|
      format.html { redirect_to topic_view_points_path(@topic), notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def set_view_point_and_topic
    @view_point = ViewPoint.find(params[:id])
    @topic = @view_point.topic
  end

  def view_point_params
    params.require(:view_point).permit(:title, :order)
  end
end
