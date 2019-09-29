class AddLevelToFighter < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :exp, :float, default: 0
  end
end
