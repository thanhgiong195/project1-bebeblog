User.create! name: "Be Thanh Giong",
  email: "dkcbvn1995@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  is_admin: true

User.create! name: "Deumi",
  email: "dkcbvn@gmail.com",
  password: "123123",
  password_confirmation: "123123"

20.times do |n|
  name = Faker::Name.name
  email = "bebe-#{n+1}@railstutorial.org"
  password = "123123"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end

users = User.order(:created_at).take 20
20.times do
  title = Faker::Lorem.sentence 10
  content = Faker::Lorem.sentence 20
  users.each{|user| user.newsposts.create! title: title, content: content}
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each{|followed| user.follow followed}
followers.each{|follower| follower.follow user}
