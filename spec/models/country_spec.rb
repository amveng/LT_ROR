# frozen_string_literal: true

# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  code       :string(10)       not null
#  name       :string(100)      not null
#  iso3       :string(3)        not null
#  numeric    :integer          not null
#  eu         :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#
require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'валидации' do
    it 'проверка на наличие названия страны' do
      country = Country.new(code: 'code', iso3: 'iso', numeric: 1)
      expect(country.save).to eq(false)
    end

    it 'проверка на наличие буквенного кода страны' do
      country = Country.new(name: 'name', iso3: 'iso', numeric: 1)
      expect(country.save).to eq(false)
    end

    it 'проверка на наличие кода iso3' do
      country = Country.new(code: 'code', name: 'name', numeric: 1)
      expect(country.save).to eq(false)
    end

    it 'проверка на наличие цифрового кода' do
      country = Country.new(code: 'code', name: 'name', iso3: 'iso')
      expect(country.save).to eq(false)
    end

    it 'проверка на максимальную длину названия страны' do
      country = Country.new(name: ('A' * 101), code: 'code', iso3: 'iso', numeric: 1)
      expect(country.save).to eq(false)
    end

    it 'проверка на максимальную длину буквенного кода' do
      country = Country.new(name: 'name', code: '123456', iso3: 'iso', numeric: 1)
      expect(country.save).to eq(false)
    end

    it 'проверка на максимальную длину кода iso3' do
      country = Country.new(name: 'name', code: 'code', iso3: '1234', numeric: 1)
      expect(country.save).to eq(false)
    end

    it 'проверка на уникальность кода страны' do
      Country.create(name: 'name', code: 'code', iso3: '123', numeric: 2)
      country = Country.new(name: 'name2', code: 'code', iso3: 'iso', numeric: 1)
      expect(country.save).to eq(false)
    end
  end
end
