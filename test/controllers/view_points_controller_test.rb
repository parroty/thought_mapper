require "test_helper"

describe ViewPointsController do
  before do
    @topic = Topic.create(title: "topic")
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
    it "creates view point and gets redirected to topic page" do
      assert_difference "ViewPoint.count", 1, "ViewPoint should be created" do
        post :create, topic_id: @topic.id, view_point: { title: "title" }
      end
      assert_redirected_to topic_path(@topic)
    end

    it "remains in new page due to an error if title is empty" do
      post :create, topic_id: @topic.id, view_point: { title: "" }

      assert_response :success
      must_render_template :new
    end
  end

  describe "update" do
    before do
      ViewPoint.delete_all
      @view_point = ViewPoint.create(topic_id: @topic.id, title: "title")
    end

    it "updates view point and gets redirected to topic page" do
      patch :update, id: @view_point.id, topic_id: @topic.id,
                     view_point: { title: "updated_title" }

      assert_redirected_to topic_path(@topic)
    end

    it "remains in edit page due to an error if title is empty" do
      patch :update, id: @view_point.id, topic_id: @topic.id,
                     view_point: { title: "" }

      assert_response :success
      must_render_template :edit
    end
  end
end
