class AddFinishedToBattles < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :completed, :boolean, default: false
  end
end
