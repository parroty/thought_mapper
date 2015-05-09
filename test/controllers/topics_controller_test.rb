require "test_helper"

class TopicsControllerTest < ActionController::TestCase
  def topic
    @topic ||= topics :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Topic.count") do
      post :create, topic: {
        description: topic.description, title: topic.title
      }
    end

    assert_redirected_to topic_path(assigns(:topic))
  end

  def test_show
    get :show, id: topic
    assert_response :success
  end

  def test_edit
    get :edit, id: topic
    assert_response :success
  end

  def test_update
    put :update, id: topic, topic: {
      description: topic.description, title: topic.title
    }
    assert_redirected_to topic_path(assigns(:topic))
  end

  def test_destroy
    assert_difference("Topic.count", -1) do
      delete :destroy, id: topic
    end

    assert_redirected_to topics_path
  end
end
