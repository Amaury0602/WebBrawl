class Fighter < ApplicationRecord
  validates :name, presence: true, allow_blank: false, format: {
    with: /\A[a-zA-Z]+\z/,
    message: "must be realistic..."
  }
  validates :health, :attack, format: { with: /\A\d+\z/, message: "You must chose number" }
  validate :max_health_and_attack, on: :create

  has_many :your_fighter, class_name: "Battle", foreign_key: "your_fighter_id", dependent: :destroy
  has_many :enemy_fighter, class_name: "Battle", foreign_key: "enemy_fighter_id", dependent: :destroy
  has_many :winner, class_name: "Battle", foreign_key: "winner_id", dependent: :destroy


  before_save :capitalize_name

  def max_health_and_attack
    if (attack + health) > 11
      errors.add(:attack, " + health points must be below 12 !")
    else
      return true
    end
  end


  def capitalize_name
    self.name.capitalize!
  end

end
