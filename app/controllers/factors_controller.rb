class FactorsController < ApplicationController
  before_action :set_factor_and_topic,
                only: [:show, :update, :destroy]

  def index
    @topic = Topic.find(params[:topic_id])
    @view_points = @topic.view_points
    @candidates  = @topic.candidates
    @factors     = @topic.factors
  end

  def show
  end

  def new
    @factor = Factor.new(
      topic_id: params[:topic_id],
      view_point_id: params[:view_point],
      candidate_id: params[:candidate]
    )

    @topic = Topic.includes(:candidates)
      .includes(:view_points)
      .find(params[:topic_id])
  end

  def edit
    @factor = Factor.find(params[:id])

    @topic = Topic.includes(:candidates)
      .includes(:view_points)
      .find(@factor.topic_id)
  end

  def create
    @factor = create_factor
    respond_to do |format|
      if @factor.save
        notice = "Factor was successfully created."
        format.html { redirect_to topic_path(@factor.topic), notice: notice }
      else
        format.html { redirect_to new_topic_factor_path(@factor.topic) }
      end
    end
  end

  def update
    respond_to do |format|
      if @factor.update(factor_params)
        notice = "Factor was successfully updated."
        format.html { redirect_to topic_path(@topic), notice: notice }
      else
        format.html { redirect_to edit_topic_factor_path(@topic, @factor) }
      end
    end
  end

  def destroy
    @factor.destroy
    respond_to do |format|
      notice = "Factor was successfully destroyed."
      format.html { redirect_to topic_path(@topic), notice: notice }
    end
  end

  private

  def set_factor_and_topic
    @factor = Factor.find(params[:id])
    @topic = @factor.topic
  end

  def create_factor
    params_with_topic_id = factor_params.merge(topic_id: params[:topic_id])
    Factor.new(params_with_topic_id)
  end

  def factor_params
    params.require(:factor).permit(
      :title, :description, :score, :view_point_id, :candidate_id)
  end
end
