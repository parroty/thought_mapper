class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.string :title
      t.string :description
      t.integer :score

      t.timestamps null: false
    end

    add_reference :factors, :view_point, index: true
    add_foreign_key :factors, :view_points

    add_reference :factors, :candidate, index: true
    add_foreign_key :factors, :candidates
  end
end
