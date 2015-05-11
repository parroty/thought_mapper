class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :basic_authentication

  private

  def basic_authentication
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV['THOUGHT_MAPPER_USER'] && pass == ENV['THOUGHT_MAPPER_PASS']
    end
  end
end
