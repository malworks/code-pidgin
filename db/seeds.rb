# create users
5.times do
  User.create!(
    name: Faker::Space.star,
    email: Faker::Internet.email,
    password: Faker::Space.star + Faker::Internet.password
  )
end
users = User.all

 # Create Sections
 12.times do
   section = Section.create!(
     name:  Faker::Hipster.sentence,
     description: Faker::Hipster.sentence,
   )
 end
 section = Section.all

 # Create Articles
 50.times do
   article = Article.create!(
     user: users.sample,
     title:  Faker::Hipster.sentence,
     body: Faker::Hipster.sentence,
     published: true,
     favorite: false,
     section_id: rand(1..12)
   )
 end
 articles = Article.all

 100.times do
   Comment.create!(
     # user: users.sample,
     article_id: rand(1..50),
     user: users.sample,
     body: Faker::Hipster.sentence
   )
 end
 comments = Comment.all

user = User.first
user.update_attributes!(
  name: 'Mallory',
  email: 'malloryworks@gmail.com',
  password: 'password',
  # role: 'admin'
)

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Section.count} wikis created"
 puts "#{Article.count} tags created"
 puts "#{Comment.count} comments created"
