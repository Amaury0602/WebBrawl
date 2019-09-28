class AddKeyToFighters < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :left_hand_id, :integer
    add_column :fighters, :right_hand_id, :integer
    add_foreign_key "fighters", "equipment", column: "left_hand_id"
    add_foreign_key "fighters", "equipment", column: "right_hand_id"
  end
end
