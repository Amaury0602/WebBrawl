class Fighter < ApplicationRecord
  has_many :your_fighter, class_name: "Battle", foreign_key: "your_fighter_id"
  has_many :enemy_fighter, class_name: "Battle", foreign_key: "enemy_fighter_id"
  has_many :winner, class_name: "Battle", foreign_key: "winner_id"
end
