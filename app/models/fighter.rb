class Fighter < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :left_hand, class_name: "Equipment"
  belongs_to :right_hand, class_name: "Equipment"

  validates :name, presence: true, allow_blank: false, format: {
    with: /\A[a-zA-Z]+\z/,
    message: "must be realistic..."
  }, length: { maximum: 13 }

  validates :health, :attack, format: { with: /\A\d+\z/, message: "must be number" }
  validate :max_health_and_attack, on: :create
  validate :min_health_and_attack, on: :create

  has_many :your_fighter, class_name: "Battle", foreign_key: "your_fighter_id", dependent: :destroy
  has_many :enemy_fighter, class_name: "Battle", foreign_key: "enemy_fighter_id", dependent: :destroy
  has_many :winner, class_name: "Battle", foreign_key: "winner_id", dependent: :destroy


  before_save :capitalize_name
  after_initialize :add_hands, if: :new_record?

  def max_health_and_attack
    if attack.class == Integer && health.class == Integer && (attack + health) != 11
      errors.add(:attack, " + health points must be equal to 11 !")
      errors.add(:health, " + attack points must be equal to 11 !")
    else
      return true
    end
  end

  def min_health_and_attack
    if attack && attack.zero? || health && health.zero?
      errors.add(:attack, "no pacifist here")
      errors.add(:health, "you need to live first (more than 0)")
    else
      return true
    end
  end

  def capitalize_name
    name.capitalize!
  end

  def battle_count
    Battle.where(your_fighter: self).or(Battle.where(enemy_fighter: self)).count
  end

  def defense_equipment
    if right_hand.mode == "armor" && left_hand.mode == "armor"
      return left_hand.value + right_hand.value
    elsif left_hand.mode == "armor"
      return left_hand.value
    elsif right_hand.mode == "armor"
      return right_hand.value
    else
      return nil
    end
  end

  def offense_equipment
    if right_hand.mode == "attack" && left_hand.mode == "attack"
      return left_hand.value + right_hand.value
    elsif left_hand.mode == "attack"
      return left_hand.value
    elsif right_hand.mode == "attack"
      return right_hand.value
    else
      return nil
    end
  end
end

def add_hands
  self.left_hand = Equipment.first
  self.right_hand = Equipment.first
end
