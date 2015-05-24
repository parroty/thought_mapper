class CandidatesController < ApplicationController
  before_action :set_candidate_and_topic, only: [
    :show, :edit, :update, :destroy, :move_higher, :move_lower]

  include Axis

  def index
    @topic = Topic.includes(candidates: [:topic]).find(params[:topic_id])
    @candidates = @topic.candidates
  end

  def show
  end

  def new
    @candidate = Candidate.new(topic_id: params[:topic_id])
    @topic = @candidate.topic
  end

  def edit
  end

  def create
    create_candidate_and_topic
    notice = "New candidate '#{@candidate.title}' was created."
    process_create(@candidate, notice)
  end

  def update
    notice = "The candidate '#{@candidate.title}' was updated."
    process_update(@candidate, candidate_params, notice)
  end

  def destroy
    notice = "The candidate '#{@candidate.title}' was destroyed."
    process_destroy(@candidate, notice)
  end

  def move_higher
    @candidate.move_higher
    redirect_to topic_path(@topic)
  end

  def move_lower
    @candidate.move_lower
    redirect_to topic_path(@topic)
  end

  private

  def set_candidate_and_topic
    @candidate = Candidate.find(params[:id])
    @topic = @candidate.topic
  end

  def create_candidate_and_topic
    params_with_topic_id = candidate_params.merge(topic_id: params[:topic_id])
    @candidate = Candidate.new(params_with_topic_id)
    @topic = @candidate.topic
  end

  def candidate_params
    params.require(:candidate).permit(:title)
  end
end
