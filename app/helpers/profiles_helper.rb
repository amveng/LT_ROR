# frozen_string_literal: true

module ProfilesHelper
  def baner_top_free
    Profile.find_by(baner_top_date_start: ..Date.today, baner_top_date_end: Date.today..)
  end

  def baner_top_free_day
    Profile.order(baner_top_date_end: :desc).pluck('baner_top_date_end').compact.first + 1.day
  end

  def baner_menu_free
    Profile.find_by(baner_menu_date_start: ..Date.today, baner_menu_date_end: Date.today..)
  end

  def baner_menu_free_day
    Profile.order(baner_menu_date_end: :desc).pluck('baner_menu_date_end').compact.first + 1.day
  end
end
