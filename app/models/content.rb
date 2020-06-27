class Content < ApplicationRecord

  auto_strip_attributes :title, delete_whitespaces: true

end
