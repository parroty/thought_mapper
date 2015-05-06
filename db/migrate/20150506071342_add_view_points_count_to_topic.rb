class AddViewPointsCountToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :view_points_count, :integer, null: false, default: 0
  end
end
