FactoryBot.define do
  factory :user do
    username { "username123" }
    email { "user@email.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end