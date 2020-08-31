# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  server_id  :bigint
#  user_id    :bigint
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country    :string
#  token      :string
#  user_ip    :string
#
require 'rails_helper'

RSpec.describe Vote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
