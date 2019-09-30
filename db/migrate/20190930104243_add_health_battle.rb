class AddHealthBattle < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :remaining_health, :integer
    add_column :battles, :duration, :integer
  end
end
