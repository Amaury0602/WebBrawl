class Battle < ApplicationRecord
  belongs_to :your_fighter, class_name: "Fighter"
  belongs_to :enemy_fighter, class_name: "Fighter"
  belongs_to :winner, class_name: "Fighter"
end
