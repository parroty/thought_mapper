class FactorsController < ApplicationController
  before_action :set_factor_and_topic, only: [
    :show, :edit, :update, :destroy]

  def index
    @topic = Topic.find(params[:topic_id])
    @view_points = @topic.view_points
    @candidates  = @topic.candidates
    @factors     = @topic.factors
  end

  def show
  end

  def new
    @factor = Factor.new(topic_id: params[:topic_id])
    @factor.view_point = ViewPoint.new(id: params[:view_point])
    @factor.candidate  = Candidate.new(id: params[:candidate])

    @topic = @factor.topic

    @view_points = @topic.view_points
    @candidates  = @topic.candidates
  end

  def edit
    @view_points = @topic.view_points
    @candidates  = @topic.candidates
  end

  def create
    @factor = create_factor
    respond_to do |format|
      if @factor.save
        notice = "Factor was successfully created."
        format.html { redirect_to topic_path(@factor.topic), notice: notice }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @factor.update(factor_params)
        notice = "Factor was successfully updated."
        format.html { redirect_to topic_path(@topic), notice: notice }
      else
        format.html { render :edit }
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
      :title, :description, :view_point_id, :candidate_id)
  end
end
