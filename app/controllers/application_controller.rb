class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :basic_authentication

  private

  def basic_authentication
    env_user = ENV["THOUGHT_MAPPER_USER"]
    env_pass = ENV["THOUGHT_MAPPER_PASS"]

    if env_user && env_pass && !Rails.env.test?
      authenticate_or_request_with_http_basic do |user, pass|
        user == env_user && pass == env_pass
      end
    end
  end
end
