class AddTopicRefToFactors < ActiveRecord::Migration
  def change
    add_reference :factors, :topic, index: true
    add_foreign_key :factors, :topics
  end
end
