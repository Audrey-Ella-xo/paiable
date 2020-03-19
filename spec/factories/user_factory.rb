FactoryBot.define do
    factory :user do
      username { "johnie" }
      name { "John" }
      lastname  { "Doe" }
      password { "foobar" }
    end
  end