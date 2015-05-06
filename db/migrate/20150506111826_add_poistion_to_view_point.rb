class AddPoistionToViewPoint < ActiveRecord::Migration
  def change
    add_column :view_points, :position, :integer
  end
end
