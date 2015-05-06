class AddTopicRefToViewPoints < ActiveRecord::Migration
  def change
    add_reference :view_points, :topic, index: true
    add_foreign_key :view_points, :topics
  end
end
