FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "password"
    password_confirmation "password"
    first_name "first"
    last_name "last"
  end
end