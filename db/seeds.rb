User.create! name: "Be Thanh Giong",
  email: "dkcbvn1995@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  is_admin: true

20.times do |n|
  name = Faker::Name.name
  email = "bebe-#{n+1}@railstutorial.org"
  password = "123123"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end

users = User.order(:created_at).take 10
10.times do
  content = Faker::Lorem.sentence 10
  users.each{|user| user.newsposts.create!(content: content)}
end
