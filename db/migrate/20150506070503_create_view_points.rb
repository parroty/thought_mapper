class CreateViewPoints < ActiveRecord::Migration
  def change
    create_table :view_points do |t|
      t.string :title
      t.integer :order

      t.timestamps null: false
    end
  end
end
