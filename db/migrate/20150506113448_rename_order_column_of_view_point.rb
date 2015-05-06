class RenameOrderColumnOfViewPoint < ActiveRecord::Migration
  def change
    rename_column :view_points, :order, :priority
  end
end
