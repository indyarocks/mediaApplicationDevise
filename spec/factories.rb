FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "FirstName-#{n}"}
    sequence(:last_name) {|n| "LastName-#{n}"}
    sequence(:email) {|n| "email-#{n}@example.com"}
    password 'foorbar'
    password_confirmation 'foobar'
  end

  factory :media do
    sequence(:description) {|n| "Description #{n}"}
    sequence(:url) {|n| "http://www.example-#{n}.com"}
    user

    factory :public_media do
      permission is_public
    end

    factory :private_media do
      permission is_private
    end
  end
end