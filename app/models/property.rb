class Property < ApplicationRecord
  belongs_to :landlord, class_name: "User"
  
  validates :name, presence: true
  validates :address, presence: true
  validates :rent, presence: true, numericality: { greater_than: 0 }
end
