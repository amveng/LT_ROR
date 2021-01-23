# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(name)
    {
      success: 'alert-success',
      error: 'alert-danger',
      info: 'alert-info',
      danger: 'alert-danger',
      warning: 'alert-warning',
      alert: 'alert-danger',
      notice: 'alert-primary'
    }[name.to_sym] || name
  end

  def publish_color(name)
    {
      published: 'success',
      failed: 'danger',
      unverified: 'info',
      arhiv: 'secondary',
      undefined: 'dark',
      created: 'primary'
    }[name.to_sym] || name
  end

  def status_icon(name)
    {
      'top': '★',
      'vip': '☆',
      'normal': '–'
    }[name.to_sym] || name
  end

  def status_color(name)
    {
      'top': 'danger',
      'vip': 'primary',
      'normal': 'secondary'
    }[name.to_sym] || name
  end

  def acces_new_server?
    !current_user.servers.find_by(publish: %w[created unverified])
  end

  def footer_content(name)
    Content.find_by(name: name)
  end

  def navbar_content
    Content.where(navbar_publish: true).order(id: :asc)
  end

  def baner_random
    Server.published.top.shuffle
  end

  def baner_top
    Profile.find_by(baner_top_status: 'published', baner_top_date_start: ..Date.today, baner_top_date_end: Date.today..)
  end

  def baner_menu
    Profile.find_by(baner_menu_status: 'published', baner_menu_date_start: ..Date.today, baner_menu_date_end: Date.today..)
  end

  def all_versions_servers
    Serverversion.where(id: Server.pluck('serverversion_id').uniq).pluck('name')
  end

  def all_rates_servers
    Server.pluck('rate').uniq.sort
  end
end
