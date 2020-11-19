# frozen_string_literal: true

FactoryBot.define do
  factory :server do
    sequence(:title) { |i| "server#{i}" }
    sequence(:urlserver) { |i| "https://server#{i}.com" }
    datestart { Time.now }
    serverversion { build(:serverversion) }
  end
end
