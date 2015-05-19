require "test_helper"

describe TopicsController do
  it "gets index" do
    get :index
    assert_response :success
    must_render_template :index
  end

  describe "new" do
    it "gets new page" do
      get :index
      assert_response :success
      must_render_template :index
    end
  end

  describe "create" do
    it "creates topic and gets redirected to topics page" do
      assert_difference "Topic.count", 1, "Topic should be created" do
        post :create, topic: { title: "title" }
      end
      assert_redirected_to topic_path(Topic.first)
    end

    it "redirects to new page if title is empty" do
      post :create, topic: { title: "" }
      assert_redirected_to new_topic_path
    end
  end

  describe "update" do
    before do
      @topic = Topic.create(title: "title")
    end

    it "updates topic and gets redirected to topics" do
      patch :update, id: @topic.id, topic: { title: "updated_title" }

      assert_redirected_to topic_path(@topic)
    end

    it "redirects to new page if title is empty" do
      patch :update, id: @topic.id, topic: { title: "" }

      assert_redirected_to edit_topic_path(@topic)
    end
  end
end
