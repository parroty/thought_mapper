require "test_helper"

class TitleTest < ActiveSupport::TestCase

  def title
    @title ||= Title.new
  end

  def test_valid
    assert title.valid?
  end

end
