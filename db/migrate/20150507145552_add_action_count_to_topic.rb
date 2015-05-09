class AddActionCountToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :actions_count, :integer, null: false, default: 0
  end
end
