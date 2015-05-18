require "test_helper"

describe ViewPointsController do
  before do
    @topic = Topic.create
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
        post :create, topic_id: @topic.id, view_point: { title: "title", priority: 1 }
      end
      assert_redirected_to topic_path(@topic)
    end

    it "redirects to new page if title and priority are empty" do
      post :create, topic_id: @topic.id, view_point: { title: "", priority: "" }
      assert_redirected_to new_topic_view_point_path(@topic)
    end
  end

  describe "update" do
    before do
      ViewPoint.delete_all
      @view_point = ViewPoint.create(topic_id: @topic.id, title: "title", priority: 1)
    end

    it "updates view point and gets redirected to topic page" do
      patch :update, id: @view_point.id, topic_id: @topic.id,
                     view_point: { title: "updated_title", priority: 2 }

      assert_redirected_to topic_path(@topic)
    end

    it "redirects to new page if title is empty" do
      patch :update, id: @view_point.id, topic_id: @topic.id,
                     view_point: { title: "", priority: "" }

      assert_redirected_to edit_topic_view_point_path(@topic, @view_point)
    end
  end
end
