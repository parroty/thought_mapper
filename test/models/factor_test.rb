require "test_helper"

describe Factor do
  it "fetches list of scores" do
    expected_list = [["Low", 1], ["Middle", 2], ["High", 3]]

    assert_equal expected_list, Factor.all_scores_list
  end

  it "returns name of the score" do
    assert_equal "Low",    Factor.new(score: 1).score_name
    assert_equal "Middle", Factor.new(score: 2).score_name
    assert_equal "High",   Factor.new(score: 3).score_name
  end
end
