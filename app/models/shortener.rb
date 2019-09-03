class Shortener < ApplicationRecord
  validates :long_url, presence: true, on: :create 
  UNIQUE_ID_LENGTH = 6

  before_create :generate_short_url

  def generate_short_url 
    url = ([*('a'..'z'),*('0'..'9')]).sample(UNIQUE_ID_LENGTH).join
    old_url = Shortener.where(short_url: url).last
    if old_url.present?
      self.generate_short_url
    else
      self.short_url = url
    end
  end

end
