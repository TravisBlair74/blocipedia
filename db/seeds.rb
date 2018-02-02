require 'random_data'

10.times do
  User.create!(
  email: RandomData.random_email,
  password: RandomData.random_sentence,
  role: "member",
  )
end
users = User.all

50.times do
  Wiki.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    user_id:   users.sample.id,
    private: false
  )
end
wikis = Wiki.all

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
