3.times do
  users_one = User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password', 
    city: 'Manila',
    country: 'Philippines'
  )
  3.times do
    users_one.pets.create(
      name: Faker::Name.first_name,
      specie: 'dog',
      breed: Faker::Creature::Dog.breed,
      age: Faker::Number.within(range: 1..15),
      gender: Faker::Creature::Dog.gender,
      vaccinated: 'Yes',
      images: [ "https://studmate.s3.ap-southeast-1.amazonaws.com/uploads/faker/images/dog/dog-flickr-DominikQN.jpg" ]
    )  
  end
  users_two = User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    city: 'Baguio',
    country: 'Philippines'
  )
  3.times do
    users_two.pets.create(
      name: Faker::Name.first_name,
      specie: 'dog',
      breed: Faker::Creature::Dog.breed,
      age: Faker::Number.within(range: 1..15),
      gender: Faker::Creature::Dog.gender,
      vaccinated: 'Yes',
      images: [ "https://studmate.s3.ap-southeast-1.amazonaws.com/uploads/faker/images/dog/https+_cdn.petcarerx.com_LPPE_images_articlethumbs_Why-Dog-Losing-Hair-Small.jpg" ]
    )  
  end
  users_three = User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    city: 'Baguio',
    country: 'Philippines'
  )
  3.times do
    users_three.pets.create(
      name: Faker::Creature::Cat.name,
      specie: 'cat',
      breed: Faker::Creature::Cat.breed,
      age: Faker::Number.within(range: 1..15),
      gender: 'Female',
      vaccinated: 'Yes',
      images: [ "https://s3.console.aws.amazon.com/s3/object/studmate?prefix=uploads/faker/images/cat/93347270_cat-1151519_1280.jpg&region=ap-southeast-1"]
    )  
  end
  users_four = User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    city: 'Manila',
    country: 'Philippines'
  )
  3.times do
    users_four.pets.create(
      name: Faker::Creature::Cat.name,
      specie: 'cat',
      breed: Faker::Creature::Cat.breed,
      age: Faker::Number.within(range: 1..15),
      gender: 'Male',
      vaccinated: 'No',
      images: [ "https://studmate.s3.ap-southeast-1.amazonaws.com/uploads/faker/images/cat/why-cats-are-best-pets-1559241235.jpg" ]
    )  
  end
end




