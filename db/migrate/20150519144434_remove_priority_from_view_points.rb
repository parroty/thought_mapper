class RemovePriorityFromViewPoints < ActiveRecord::Migration
  def change
    remove_column :view_points, :priority
  end
end
