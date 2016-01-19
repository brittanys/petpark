require 'faker'
FactoryGirl.define do
  factory :posting do |f|
    f.title { Faker::Lorem.word }
    f.description { Faker::Lorem.paragraph }
  end
end
