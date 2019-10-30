# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Fostering.destroy_all
Dog.destroy_all
User.destroy_all

emails = ["dogowner1@email.com", "dogowner2@email.com", "dogowner3@email.com", "dogowner4@email.com", "dogowner5@email.com"]
first_names = ["oprah", "phoebe", "george", "seth", "kristen"]
last_names = ["winfrey", "buffay", "harrison", "rogan", "wiig"]
descriptions = ["I love the doggos", "I love the doggos", "I love the doggos", "I love the doggos", "I love the doggos" ]
ages = [45, 29, 60, 38, 40]
user_photo = [
  "http://static.oprah.com/images/o2/201308-omag-what-know-949x534.jpg",
  "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.hellogiggles.com%2Fuploads%2F2016%2F05%2F23015746%2Fphoebe.jpg&w=400&c=sc&poi=face&q=85",
  "https://assets.smoothradio.com/2018/07/george-harrison-1519399672-view-0.jpg",
  "localhost:3000/assets/user_photos/phoebe.jpg",
  "localhost:3000/assets/user_photos/george.jpg",
  "localhost:3000/assets/user_photos/seth.jpg",
  "localhost:3000/assets/user_photos/kristen.jpg"
]


dog_names = ["lola", "khaleesi", "roo", "mocha", "bubba"]
dog_ages = ["1 year", "3 years", "4 months", "5 months", "6 months"]
dog_descriptions = [
"Full of energy and cuddles!",
"Great with children, loves a good massage - a true #queen.",
"Sassy, smart, and sweet!",
"A loving and gentle pup, loves to cuddle",
"Loves to play ball, great with other dogs"
]
breeds = ["boxer", "mutt", "pitbull", "labrador", "mutt"]
locations = ["canggu", "canggu", "seminyak", "seminyak", "canggu"]
photo = ["https://res.cloudinary.com/le-wagon1234/image/upload/v1572331601/tom-hills-zoF_dgsldlY-unsplash_tjcegs.jpg",
  "https://res.cloudinary.com/le-wagon1234/image/upload/v1572355540/roi-dimor-4Tx3p2DT4F4-unsplash_bymuqh.jpg",
"https://res.cloudinary.com/le-wagon1234/image/upload/v1572331333/zachary-casler-99Qi-fLC3hs-unsplash_jadihq.jpg",
"https://res.cloudinary.com/le-wagon1234/image/upload/v1572331328/jairo-alzate-sssxyuZape8-unsplash_qkwpqx.jpg",
"https://res.cloudinary.com/le-wagon1234/image/upload/v1572331332/hanny-naibaho--Go4DH2pZbc-unsplash_n5brwi.jpg"
]

5.times do
  puts 'creating users'
  user = User.new(
    email: emails.first,
    password: "password",
    first_name: first_names.first,
    last_name: last_names.first,
    description: descriptions.first,
    age: ages.first
  )
  puts user_photo.first.class

  user.remote_photo_url = user_photo.first


  user.save!

  puts 'creating doggies'
  dog = Dog.new(
    name: dog_names.first,
    breed: breeds.first,
    age: dog_ages.first,
    description: dog_descriptions.first,
    location: locations.first,
    user_id: user.id,
  )
  dog.remote_photo_url = photo.first

  dog.save!

  emails.shift
  first_names.shift
  last_names.shift
  descriptions.shift
  ages.shift
  user_photo.shift
  dog_names.shift
  breeds.shift
  dog_ages.shift
  dog_descriptions.shift
  locations.shift
  photo.shift
end

