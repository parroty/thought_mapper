class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :title

      t.timestamps null: false
    end

    add_reference :actions, :topic, index: true
    add_foreign_key :actions, :topics
  end
end
