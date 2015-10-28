# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
beth = User.new(
  name:     'Beth',
  email:    'beth@example.com',
  password: 'helloworld'
)
beth.skip_confirmation!
beth.save!

ben = User.new(
  name:     'Ben',
  email:    'ben@example.com',
  password: 'helloworld'
)
ben.skip_confirmation!
ben.save!

kevin = User.new(
  name:     'Kevin',
  email:    'kevin@example.com',
  password: 'bbbunnyboy'
)
kevin.skip_confirmation!
kevin.save!

users = User.all

35.times do
  Item.create!(
    name: Faker:: Lorem.sentence,
    user: users.sample
  )
end




puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} todos created"

