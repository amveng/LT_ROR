class Vote < ApplicationRecord
  belongs_to :server
  belongs_to :user

  before_create -> {self.token = generate_token}

  scope :month, -> { where(date: 30.days.ago..0.days.ago) }
  scope :notnil, -> { where.not(country: nil) }

  private

  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless Vote.exists?({token: token})
    end
  end

end
