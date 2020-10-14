# frozen_string_literal: true

class ServerCreateMailer < ApplicationMailer
  default from: 'admin@lineagetop.com',
          template_path: 'mailers/servers'

  def server_created(server)
    @server = server
    mail to: 'magway2k@mail.ru',
         subject: 'Server created'
  end
end
