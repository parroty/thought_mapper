require "test_helper"

describe TopicsController do
  describe "basic_authentication" do
    it "gets index page fails with authentication error" do
      Rails.stub(:env, ActiveSupport::StringInquirer.new("production")) do
        get :index
        assert_response 401
      end
    end
  end
end