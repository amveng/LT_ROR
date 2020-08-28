require 'rails_helper'

RSpec.describe Content, type: :model do
  context 'валидации' do
    it 'проверка на удаление пробелов при записи в базу' do
      content = Content.new(name: ' n a m e ')
      expect(content.save).to eq(true)
      expect(content.name).to eq('name')
    end
  end
end
