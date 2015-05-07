class CandidatesController < ApplicationController
  before_action :set_candidate_and_topic,
    only: [:show, :edit, :update, :destroy]

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
    params_with_topic_id = action_params.merge({topic_id: params[:topic_id]})
    @candidate = Candidate.new(params_with_topic_id)
    @topic = @candidate.topic

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to topic_candidates_path(@topic), notice: 'Candidate was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidate.update(action_params)
        format.html { redirect_to topic_candidates_path(@topic), notice: 'Topic was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to topic_candidates_path(@topic), notice: 'Topic was successfully destroyed.' }
    end
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
