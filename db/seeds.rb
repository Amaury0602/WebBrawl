require 'faker'



Battle.destroy_all
Fighter.destroy_all
Equipment.destroy_all

puts "everything destroyed"


hand = Equipment.create(mode: "offense", name: "Bare Knuckles", value: 0, level: 0);
small_shield = Equipment.create(mode: "defense", name: "Small shield", value: 2, level: 1);
wood_sword = Equipment.create(mode: "offense", name: "Wooden sword", value: 2, level: 3)
great_shield = Equipment.create(mode: "defense", name: "Great shield", value: 3, level: 5)
long_sword = Equipment.create(mode: "offense", name: "Long sword",  value: 3, level: 6)


5.times do
  Fighter.create(
    name: Faker::Superhero.name.delete(" "),
    health: 10,
    attack: 1,
    left_hand: Equipment.first,
    right_hand: Equipment.first,
    )
end
