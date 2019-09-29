class Equipment < ApplicationRecord
  has_many :left_hand, class_name: "Fighter", foreign_key: "left_hand_id"
  has_many :right_hand, class_name: "Fighter", foreign_key: "right_hand_id"


  def self.can_handle(fighter_level)
  end
end
