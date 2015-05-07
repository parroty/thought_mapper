class RenameActionsCountToCandidatesCount < ActiveRecord::Migration
  def change
    rename_column :topics, :actions_count, :candidates_count
  end
end
