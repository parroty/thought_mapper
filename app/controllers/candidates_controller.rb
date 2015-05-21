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

  def create
    @candidate = create_candidate
    @topic = @candidate.topic

    respond_to do |format|
      if @candidate.save
        path   = topic_path(@candidate.topic)
        notice = "New candidate '#{@candidate.title}' was successfully created."
        format.html { redirect_to path, notice: notice }
      else
        format.html { render :new, topic_id: @candidate.topic.id }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidate.update(action_params)
        path   = topic_path(@topic)
        notice = "The candidate '#{@candidate.title}' was successfully updated."
        format.html { redirect_to path, notice: notice }
      else
        format.html { render :edit, topic_id: @candidate.topic.id }
      end
    end
  end

  def destroy
    @candidate.destroy
    respond_to do |format|
      path   = topic_path(@topic)
      notice = "The candidate '#{@candidate.title}' was successfully destroyed."
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

  def create_candidate
    params_with_topic_id = action_params.merge(topic_id: params[:topic_id])
    Candidate.new(params_with_topic_id)
  end

  def action_params
    params.require(:candidate).permit(:title)
  end
end
