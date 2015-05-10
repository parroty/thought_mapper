class AddCommentToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :comment, :text
  end
end
