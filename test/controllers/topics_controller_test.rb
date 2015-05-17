require "test_helper"

describe TopicsController do
  before do
    Topic.create
  end

  it "gets index" do
    get :index
    assert_response :success
    must_render_template :index
  end
end
