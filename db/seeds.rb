users = 10.times.map do
  User.create(
    id: Faker::Number.digit,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

3.times do
  Pet.create(
    name: 'sample',
    specie: 'dog',
    breed: 'doge',
    age: 1,
    birthdate: Faker::Date.between(from: 360.days.ago, to: Date.today),
    gender: 'Male',
    vaccinated: 'Yes',
    images: [],
    user_id: users.id.sample
  )
end