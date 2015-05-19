require "test_helper"

class TopicTest < ActiveSupport::TestCase
  def topic
    @topic ||= Topic.new(title: "title")
  end

  def test_valid
    assert topic.valid?
  end
end
