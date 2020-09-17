module PetitionsHelper
  def status_color(name)
    { create: 'primary',
      rejected: 'danger',
      review: 'warning',
      closed: 'secondary' }[name.to_sym] || name
  end
end
