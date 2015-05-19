require "test_helper"

describe FactorsController do
  before do
    @topic = Topic.create(title: "title")
  end

  it "gets index" do
    get :index, topic_id: @topic.id
    assert_response :success
    must_render_template :index
  end
end
