require "test_helper"

describe TopicsController do
  before do
    @user = "DUMMY_USER"
    @pass = "DUMMY_PASS"

    ENV.expects(:[]).with("THOUGHT_MAPPER_USER").returns(@user)
    ENV.expects(:[]).with("THOUGHT_MAPPER_PASS").returns(@pass)

    Rails.stubs(:env).returns("production".inquiry)
  end

  describe "basic_authentication" do
    describe "with valid user and pass" do
      before do
        @original = @request.env["HTTP_AUTHORIZATION"]
        @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{@user}:#{@pass}")
      end

      after do
        @request.env["HTTP_AUTHORIZATION"] = @original
      end

      it "succeeds to get page" do
        get :index
        assert_response 200
      end
    end

    describe "without valid user and pass" do
      it "fails to get page" do
        get :index
        assert_response 401
      end
    end
  end
end
