require "test_helper"

describe FactorsController do
  before do
    @topic      = Topic.create(title: "title")
    @view_point = ViewPoint.create(topic_id: @topic.id, title: "title")
    @candidate  = Candidate.create(topic_id: @topic.id, title: "title")
  end

  it "gets index" do
    get :index, topic_id: @topic.id
    assert_response :success
    must_render_template :index
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
      assert_difference "Factor.count", 1, "Candidate should be created" do
        post :create, topic_id: @topic.id, factor: { title: "title" }
      end
      assert_redirected_to topic_path(@topic)
    end

    it "redirects to new page if title is empty" do
      post :create, topic_id: @topic.id, factor: { title: "" }

      assert_redirected_to new_topic_factor_path(@topic)
    end
  end

  describe "update" do
    before do
      Factor.delete_all
      @factor = Factor.create(topic_id: @topic.id, title: "title")
    end

    it "updates candidate and gets redirected to topic page" do
      patch :update, id: @factor.id, topic_id: @topic.id, factor: { title: "updated_title" }
      assert_redirected_to topic_path(@topic)
    end

    it "redirects to new page if title is empty" do
      patch :update, id: @factor.id, topic_id: @topic.id, factor: { title: "" }
      assert_redirected_to edit_topic_factor_path(@topic, @factor)
    end
  end
end
