class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.references :your_fighter, foreign_key: {to_table: 'fighters'}
      t.references :enemy_fighter, foreign_key: {to_table: 'fighters'}
      t.references :winner, foreign_key: {to_table: 'fighters'}
      t.timestamps
    end
  end
end
