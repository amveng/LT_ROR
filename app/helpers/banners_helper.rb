# frozen_string_literal: true

module BannersHelper
  def banners_position
    {
      top: 'Верхний баннер 1920х600',
      menu: 'Контент баннер 240х400',
      left: 'Левый баннер 160х600',
      right: 'Правый баннер 160х600'
    }
  end

  def banner_publication_status(name)
    {
      created: 'Баннер создан',
      paid: 'Баннер оплачен',
      banned_from_showing: 'Баннер запрещен к показу администрацией',
      published: 'Баннер опубликован',
      unverified: 'Баннер на проверке',
      finished: 'Показ баннера закончен'
    }[name.to_sym] || name
  end
end
