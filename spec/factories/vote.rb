# frozen_string_literal: true

FactoryBot.define do
  factory :vote do
    date { Date.today }
    user { build(:user) }
    server { build(:server) }
  end
end
