require 'faker'



Battle.destroy_all
Fighter.destroy_all

puts "everything destroyed"


Equipment.create(name: "hand");


5.times do
  Fighter.create(
    name: Faker::Superhero.name,
    health: 10,
    attack: 1,
    left_hand: Equipment.first,
    right_hand: Equipment.first,
    )
end
