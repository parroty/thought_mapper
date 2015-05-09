class AddFactorCountToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :factors_count, :integer, null: false, default: 0
  end
end
