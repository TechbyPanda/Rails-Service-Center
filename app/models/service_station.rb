class ServiceStation < ApplicationRecord
  belongs_to :user
  has_many :pakages
end
