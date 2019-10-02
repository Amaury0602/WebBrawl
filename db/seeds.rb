require 'faker'


Battle.destroy_all
Fighter.destroy_all
Equipment.destroy_all

puts "everything destroyed"


hand = Equipment.create(mode: "attack", name: "Bare Knuckles", value: 0, level: 0);
small_shield = Equipment.create(mode: "armor", name: "Small shield", value: 2, level: 1);
wood_sword = Equipment.create(mode: "attack", name: "Wooden sword", value: 2, level: 3)
great_shield = Equipment.create(mode: "armor", name: "Great shield", value: 3, level: 5)
long_sword = Equipment.create(mode: "attack", name: "Long sword",  value: 3, level: 6)


Fighter.create(name: "Nietzsche",
  health: 8,
  attack: 3,
  left_hand: Equipment.first,
  right_hand: Equipment.first,
  photo: Rails.root.join("app/assets/images/nietzsche.PNG").open
 )

Fighter.create(name: "Colossus",
  health: 5,
  attack: 6,
  left_hand: Equipment.first,
  right_hand: Equipment.first,
  photo: Rails.root.join("app/assets/images/colossus.PNG").open
)
