require "test_helper"

describe "operations for topics", :capybara do
  before do
    Topic.delete_all
  end

  describe "create" do
    it "creates a new view point" do
      visit topics_path
      click_link("New")

      fill_in "Title",       with: "topic_title"
      fill_in "Description", with: "topic_description"
      fill_in "Comment",     with: "topic_comment"
      click_button("Save")

      topic = Topic.first

      assert_equal 1, Topic.count
      assert_equal "topic_title",       topic.title
      assert_equal "topic_description", topic.description
      assert_equal "topic_comment",     topic.comment
    end
  end

  describe "update and delete" do
    before do
      Topic.create(title: "topic_title")
    end

    it "updates topic" do
      visit topics_path
      click_link("Edit")

      fill_in "Title",       with: "new_title"
      fill_in "Description", with: "new_description"
      fill_in "Comment",     with: "new_comment"
      click_button("Save")

      topic = Topic.first

      assert_equal 1, Topic.count
      assert_equal "new_title",       topic.title
      assert_equal "new_description", topic.description
      assert_equal "new_comment",     topic.comment
    end

    it "deletes topic" do
      visit topics_path
      click_link("Delete")

      assert_equal 0, Topic.count
    end
  end
end
