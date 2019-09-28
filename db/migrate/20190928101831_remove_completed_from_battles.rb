class RemoveCompletedFromBattles < ActiveRecord::Migration[5.2]
  def change
    remove_column :battles, :completed
  end
end
