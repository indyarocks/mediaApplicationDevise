# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "FirstName-#{n}"}
    sequence(:last_name) {|n| "LastName-#{n}"}
    sequence(:email) {|n| "email-#{n}@example.com"}
    password 'chandan123'
    password_confirmation 'chandan123'
  end
end