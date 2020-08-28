# frozen_string_literal: true

class Content < ApplicationRecord
  auto_strip_attributes :name, delete_whitespaces: true
end
