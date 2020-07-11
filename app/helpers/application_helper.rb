# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(name)
    { success: 'alert-success',
      error: 'alert-danger',
      info: 'alert-info',
      danger: 'alert-danger',
      warning: 'alert-warning',
      alert: 'alert-danger',
      notice: 'alert-primary' }[name.to_sym] || name
  end

  def publish_color(name)
    { published: 'success',
      failed: 'danger',
      unverified: 'info',
      create: 'primary' }[name.to_sym] || name
  end

  def status_color(name)
    { '1': 'danger',
      '2': 'primary',
      '3': 'secondary' }[name.to_sym] || name
  end

  def server_not_work?
    Content.find_by(name: 'index').header.blank?
  end

  def acces_new_server?
    !current_user.servers.find_by(publish: %w[create unverified])
  end

  def content(name)
    Content.find_by(name: name)
  end

  def all_versions_servers
    Serverversion.where(id: Server.pluck('serverversion_id').uniq).pluck('name')
  end

  def all_rates_servers
    Server.pluck('rate').uniq.sort
  end
end
