# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'username' }
    sequence(:email) { |i| "user#{i}@example.com" }
    password { 'password' }
  end
end
