# frozen_string_literal: true

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
  before(:each) do
    @user = User.create(
      username: Faker::Internet.username(specifier: 4..42),
      email: Faker::Internet.email,
      password: Devise.friendly_token[0, 6]
    )
  end

  context 'проверяем создание данных' do
    it 'User ок' do
      user = User.exists?(id: @user.id)
      expect(user).to eq(true)
    end

    it 'Profile автосоздание ок' do
      profile = Profile.exists?(user_id: @user.id)
      expect(profile).to eq(true)
    end
  end
end
