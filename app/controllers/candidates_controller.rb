class CandidatesController < ApplicationController
  before_action :set_candidate_and_topic, only: [
    :show, :edit, :update, :destroy, :move_higher, :move_lower]

  def index
    @topic = Topic.find(params[:topic_id])
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

  def create_candidate
    params_with_topic_id = action_params.merge(topic_id: params[:topic_id])
    Candidate.new(params_with_topic_id)
  end

  def create
    @candidate = create_candidate
    respond_to do |format|
      if @candidate.save
        path   = topic_path(@candidate.topic)
        notice = "Candidate was successfully created."
        format.html { redirect_to path, notice: notice }
      else
        format.html { redirect_to new_topic_candidate_path(@candidate.topic) }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidate.update(action_params)
        path   = topic_path(@topic)
        notice = "Topic was successfully updated."
        format.html { redirect_to path, notice: notice }
      else
        path = edit_topic_candidate_path(@candidate.topic, @candidate)
        format.html { redirect_to path }
      end
    end
  end

  def destroy
    @candidate.destroy
    respond_to do |format|
      path   = topic_path(@topic)
      notice = "Topic was successfully destroyed."
      format.html { redirect_to path, notice: notice }
    end
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

  def action_params
    params.require(:candidate).permit(:title)
  end
end
