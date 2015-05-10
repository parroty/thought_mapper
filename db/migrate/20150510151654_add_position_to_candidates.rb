class AddPositionToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :position, :integer
  end
end
