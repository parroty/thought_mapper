require "test_helper"

class CandidateTest < ActiveSupport::TestCase
  def candidate
    @candidate ||= Candidate.new
  end

  def test_valid
    assert candidate.valid?
  end
end
