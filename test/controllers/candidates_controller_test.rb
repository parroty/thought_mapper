require "test_helper"

describe CandidatesController do
  before do
    @topic = Topic.create(title: "title")
  end

  describe "index" do
    it "gets index page" do
      get :index, topic_id: @topic.id
      assert_response :success
      must_render_template :index
    end
  end

  describe "new" do
    it "gets new page" do
      get :index, topic_id: @topic.id
      assert_response :success
      must_render_template :index
    end
  end

  describe "create" do
    it "creates candidate and gets redirected to topic page" do
      assert_difference "Candidate.count", 1, "Candidate should be created" do
        post :create, topic_id: @topic.id, candidate: { title: "title" }
      end
      assert_redirected_to topic_path(@topic)
    end

    it "redirects to new page if title is empty" do
      post :create, topic_id: @topic.id, candidate: { title: "" }
      assert_redirected_to new_topic_candidate_path(@topic)
    end
  end

  describe "update" do
    before do
      Candidate.delete_all
      @candidate = Candidate.create(topic_id: @topic.id, title: "title")
    end

    it "updates candidate and gets redirected to topic page" do
      patch :update, id: @candidate.id, topic_id: @topic.id, candidate: { title: "updated_title" }
      assert_redirected_to topic_path(@topic)
    end

    it "redirects to new page if title is empty" do
      patch :update, id: @candidate.id, topic_id: @topic.id, candidate: { title: "" }
      assert_redirected_to edit_topic_candidate_path(@topic, @candidate)
    end
  end
end
