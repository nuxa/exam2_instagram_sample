# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

image_path = File.join(Rails.root, "test/fixtures/images/nicoinu.jpg")

10.times do |n|
  email = "example-#{n+1}@example.com"
  password = Faker::Internet.password(8, 8)
  name = Faker::Name.name
  user = User.new(email: email,
                  password: password,
                  password_confirmation: password,
                  name: name)
  user.skip_confirmation!
  user.save

  10.times do |m|
    Post.create!(content: Faker::Lorem.sentence,
                 user_id: user.id,
                 image: File.new(image_path))
  end
end
