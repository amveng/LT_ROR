# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id           :bigint           not null, primary key
#  name         :string
#  header       :string
#  menu         :string
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  menu_publish :boolean          default(FALSE), not null
#
require 'rails_helper'

RSpec.describe Content, type: :model do
  context 'валидации' do
    it 'проверка на наличие пункта меню' do
      content = Content.new
      expect(content.save).to eq(false)
    end
  end
end
