# == Schema Information
#
# Table name: profiles
#
#  id                    :bigint           not null, primary key
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  safedelete            :datetime
#  ltc                   :decimal(, )      default(0.0)
#  baner_top_date_start  :date
#  baner_top_date_end    :date
#  baner_top_img         :string
#  baner_top_url         :string
#  baner_top_status      :string           default("undefined")
#  baner_menu_date_start :date
#  baner_menu_date_end   :date
#  baner_menu_img        :string
#  baner_menu_url        :string
#  baner_menu_status     :string           default("undefined")
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
