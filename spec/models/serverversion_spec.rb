# == Schema Information
#
# Table name: serverversions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#
require 'rails_helper'

RSpec.describe Serverversion, type: :model do
  context 'проверяем создание данных' do
    it 'Serverversion ok' do
      serverversion = Serverversion.new(name: Faker::Ancient.titan)
      expect(serverversion.save).to eq(true)
    end
  end
  context 'валидации' do
    it 'проверка на наличие названия' do
      serverversion = Serverversion.new
      expect(serverversion.save).to eq(false)
    end
  end
end
