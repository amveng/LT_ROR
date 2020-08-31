# == Schema Information
#
# Table name: servers
#
#  id               :bigint           not null, primary key
#  rating           :decimal(3, 2)    default(1.0)
#  publish          :string           default("create"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  title            :string(42)
#  urlserver        :string
#  datestart        :datetime
#  user_id          :bigint
#  rate             :integer          default(1), not null
#  serverversion_id :bigint           default(1), not null
#  status           :integer          default(3), not null
#  imageserver      :string
#  description      :text
#  status_expires   :date             default(Wed, 01 Jan 2020), not null
#  failed           :text
#  token            :string
#
require 'rails_helper'

RSpec.describe Server, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
