class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :mode
      t.string :name
      t.integer :value
      t.integer :level

      t.timestamps
    end
  end
end
