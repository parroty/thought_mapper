require "test_helper"

class ViewPointTest < ActiveSupport::TestCase
  def view_point
    @view_point ||= ViewPoint.new
  end

  def test_valid
    assert view_point.valid?
  end
end
