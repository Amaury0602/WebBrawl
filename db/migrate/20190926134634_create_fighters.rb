class CreateFighters < ActiveRecord::Migration[5.2]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :health
      t.integer :attack

      t.timestamps
    end
  end
end
