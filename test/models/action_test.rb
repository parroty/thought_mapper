require "test_helper"

class ActionTest < ActiveSupport::TestCase
  def action
    @action ||= Action.new
  end

  def test_valid
    assert action.valid?
  end
end
