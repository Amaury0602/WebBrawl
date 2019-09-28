class Fighter < ApplicationRecord

  belongs_to :left_hand, class_name: "Equipment"
  belongs_to :right_hand, class_name: "Equipment"

  validates :name, presence: true, allow_blank: false, format: {
    with: /\A[a-zA-Z]+\z/,
    message: "must be realistic..."
  }
  validates :health, :attack, format: { with: /\A\d+\z/, message: "must be number" }
  validate :max_health_and_attack, on: :create
  validate :min_health_and_attack, on: :create

  has_many :your_fighter, class_name: "Battle", foreign_key: "your_fighter_id", dependent: :destroy
  has_many :enemy_fighter, class_name: "Battle", foreign_key: "enemy_fighter_id", dependent: :destroy
  has_many :winner, class_name: "Battle", foreign_key: "winner_id", dependent: :destroy


  before_save :capitalize_name

  def max_health_and_attack
    if attack.class == Integer && health.class == Integer && (attack + health) != 11
      errors.add(:attack, " + health points must be equal to 11 !")
      errors.add(:health, " + attack points must be equal to 11 !")
    else
      return true
    end
  end

  def min_health_and_attack
    if attack.zero? || health.zero?
      errors.add(:attack, "no pacifist here")
      errors.add(:health, "you need to live first (more than 0)")
    else
      return true
    end
  end


  def capitalize_name
    self.name.capitalize!
  end

end
