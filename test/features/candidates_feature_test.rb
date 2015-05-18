require "test_helper"

describe "operations for candidates", :capybara do
  before do
    @topic = Topic.create
    Candidate.delete_all
  end

  describe "create" do
    it "creates a new candidate" do
      visit topic_path(@topic)
      click_link("New Candidate")

      fill_in "Title", with: "new_candidate_title"
      click_button("Save")

      assert_equal 1, Candidate.count
      assert_equal "new_candidate_title", Candidate.first.title
    end
  end

  describe "update and delete" do
    before do
      Candidate.create(topic_id: @topic.id, title: "original_title")
    end

    it "updates candidate" do
      visit topic_path(@topic)
      click_link("original_title")

      fill_in "Title", with: "updated_candidate_title"
      click_button("Save")

      assert_equal 1, Candidate.count
      assert_equal "updated_candidate_title", Candidate.first.title
    end

    it "deletes candidate" do
      visit topic_path(@topic)
      click_link("original_title")

      click_link("Destroy")

      assert_equal 0, Candidate.count
    end
  end

  describe "move" do
    before do
      @candidate1 = Candidate.create(topic_id: @topic.id, title: "title1")
      @candidate2 = Candidate.create(topic_id: @topic.id, title: "title2")
    end

    it "moves candidate lower" do
      visit topic_path(@topic)
      assert_equal ["title1", "title2"], candidate_links

      find("a#candidate_move_lower_#{@candidate1.id}").click
      assert_equal ["title2", "title1"], candidate_links
    end

    it "moves candidate higher" do
      visit topic_path(@topic)
      assert_equal ["title1", "title2"], candidate_links

      find("a#candidate_move_higher_#{@candidate2.id}").click
      assert_equal ["title2", "title1"], candidate_links
    end
  end

  private

  def candidate_links
    all(".candidate_link").map { |e| e.text }
  end
end
