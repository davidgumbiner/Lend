namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      user_name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: user_name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 10)
    50.times do
      lendable_name = Faker::Lorem.sentence(5)
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.lendables.create!(name: lendable_name, content: content) }
    end
  end
end