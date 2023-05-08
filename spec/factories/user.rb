FactoryBot.define do
  factory :user do
    username { "User_#{rand(999)}" }
    email { "test_user_#{rand(999)}@example.com" }
    after(:build) { |u| u.password_confirmation = u.password = 'Password123456' }
  end
end
