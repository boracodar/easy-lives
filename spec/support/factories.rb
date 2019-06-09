# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "person#{n}@example.com" }

  factory :user do
    name { 'Homer Simpson' }
    email
    password { 'secret1234' }
    password_confirmation { 'secret1234' }
    confirmed_at { Time.current }
  end

  factory :live do
    subject { 'Introduction to Springfield' }

    association :author, factory: :user
  end
end
