class Offer < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many_attached :photos

  validates :photos, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
