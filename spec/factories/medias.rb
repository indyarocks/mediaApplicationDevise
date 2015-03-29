# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :media do
    sequence(:description) {|n| "Description #{n}"}
    sequence(:url) {|n| "http://www.example-#{n}.com"}
    association :user, factory: :user

    factory :public_media do
      permission Media.permissions[:is_public]
    end

    factory :private_media do
      permission Media.permissions[:is_private]
    end
  end
end
