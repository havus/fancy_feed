FactoryBot.define do
  factory :user do
    username { "user_#{rand(100)}" }
    display_name { "Mr. #{username}" }
  end
end
