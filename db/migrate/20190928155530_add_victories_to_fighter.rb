class AddVictoriesToFighter < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :victories, :integer, default: 0
  end
end
