require "test_helper"

describe "operations for factors", :capybara do
  before do
    @topic      = Topic.create(title: "title")
    @view_point = ViewPoint.create(topic_id: @topic.id, title: "title")
    @candidate  = Candidate.create(topic_id: @topic.id, title: "title")

    Factor.delete_all
  end

  describe "create" do
    it "creates a new factor" do
      visit topic_path(@topic)
      click_link("New Factor")

      fill_in "Title", with: "title"
      fill_in "Description", with: "description"
      select "Middle", from: "Score"
      click_button("Save")

      factor = Factor.first

      assert_equal 1, Factor.count
      assert_equal "title", factor.title
      assert_equal "description", factor.description
      assert_equal "Middle", factor.score_name
    end
  end

  describe "update and delete" do
    before do
      Factor.create(
        topic_id: @topic.id,
        view_point_id: @view_point.id,
        candidate_id: @candidate.id,
        title: "original_title",
        description: "description",
        score: Factor::Score::LOW
      )
    end

    it "updates candidate" do
      visit topic_path(@topic)
      click_link("original_title")

      fill_in "Title", with: "new_title"
      fill_in "Description", with: "new_description"
      select "Middle", from: "Score"
      click_button("Save")

      factor = Factor.first

      assert_equal 1, Factor.count
      assert_equal "new_title", factor.title
      assert_equal "new_description", factor.description
      assert_equal "Middle", factor.score_name
    end

    it "deletes candidate" do
      visit topic_path(@topic)
      click_link("original_title")

      click_link("Destroy")

      assert_equal 0, Factor.count
    end
  end
end
