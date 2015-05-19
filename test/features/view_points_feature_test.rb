require "test_helper"

describe "operations for viewpoints", :capybara do
  before do
    @topic = Topic.create(title: "title")
    ViewPoint.delete_all
  end

  describe "create" do
    it "creates a new view point" do
      visit topic_path(@topic)
      click_link("New View Point")

      fill_in "Title", with: "new_view_point_title"
      click_button("Save")

      assert_equal 1, ViewPoint.count
      assert_equal "new_view_point_title", ViewPoint.first.title
    end
  end

  describe "update and delete" do
    before do
      ViewPoint.create(topic_id: @topic.id, title: "original_title")
    end

    it "updates view point" do
      visit topic_path(@topic)
      click_link("original_title")

      fill_in "Title", with: "updated_view_point_title"
      click_button("Save")

      assert_equal 1, ViewPoint.count
      assert_equal "updated_view_point_title", ViewPoint.first.title
    end

    it "deletes view point" do
      visit topic_path(@topic)
      click_link("original_title")

      click_link("Destroy")

      assert_equal 0, ViewPoint.count
    end
  end

  describe "move" do
    before do
      @view_point1 = ViewPoint.create(topic_id: @topic.id, title: "title1")
      @view_point2 = ViewPoint.create(topic_id: @topic.id, title: "title2")
    end

    it "moves view point lower" do
      visit topic_path(@topic)
      assert_equal %w(title1 title2), view_point_links

      find("a#view_point_move_lower_#{@view_point1.id}").click
      assert_equal %w(title2 title1), view_point_links
    end

    it "moves candidate higher" do
      visit topic_path(@topic)
      assert_equal %w(title1 title2), view_point_links

      find("a#view_point_move_higher_#{@view_point2.id}").click
      assert_equal %w(title2 title1), view_point_links
    end
  end

  private

  def view_point_links
    all(".view_point_link").map(&:text)
  end
end
