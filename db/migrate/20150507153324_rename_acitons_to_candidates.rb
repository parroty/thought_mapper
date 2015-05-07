class RenameAcitonsToCandidates < ActiveRecord::Migration
  def change
    rename_table :actions, :candidates
  end
end
