5.times do
  users = User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password', 
    city: 'Manila',
    country: 'Philippines'
  )
  2.times do
    users.pets.create(
      name: Faker::Name.first_name,
      specie: 'dog',
      breed: 'doge',
      age: 1,
      birthdate: Faker::Date.between(from: 360.days.ago, to: Date.today),
      gender: 'Male',
      vaccinated: 'Yes',
      images: [],
    )  
end




