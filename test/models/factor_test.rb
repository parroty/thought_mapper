require "test_helper"

class FactorTest < ActiveSupport::TestCase

  def factor
    @factor ||= Factor.new
  end

  def test_valid
    assert factor.valid?
  end

end
