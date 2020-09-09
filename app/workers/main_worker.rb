# frozen_string_literal: true

class MainWorker
  include Sidekiq::Worker

  def perform




    
    ParserMessage.create(
      name: 'Main',
      typemsg: 'complite',
      body: 'complite main'
    )
  end
end
