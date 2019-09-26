require 'faker'



Battle.destroy_all
Fighter.destroy_all

puts "everything destroyed"


5.times do
  Fighter.create(name: Faker::Superhero.name, health: 10, attack: 1)
end

fighter_ids = []
Fighter.all.each do |fighter|
  fighter_ids << fighter.id
end



