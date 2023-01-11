class Pakage < ApplicationRecord
  has_one_attached :pakage_image
  belongs_to :service_station
end
