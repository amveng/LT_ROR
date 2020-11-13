# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'username' }
    sequence(:email) { |i| "user#{i}@example.com" }
    password { 'password' }
  end

  factory :vote do
    date { Date.today }
    user { build(:user) }
    server { build(:server) }
  end

  factory :serverversion do
    name { 'version1' }
  end

  factory :server do
    sequence(:title) { |i| "server#{i}" }
    sequence(:urlserver) { |i| "https://server#{i}.com" }
    datestart { Time.now }
    serverversion { build(:serverversion) }
  end
end
