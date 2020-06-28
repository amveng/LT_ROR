class Content < ApplicationRecord

  auto_strip_attributes :name, delete_whitespaces: true

end
