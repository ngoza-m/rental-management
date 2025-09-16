class Property < ApplicationRecord
  belongs_to :landlord, class_name: "User"
  has_one :lease
  has_one :tenant, through: :lease

  validates :name, presence: true
  validates :address, presence: true
  validates :rent, presence: true, numericality: { greater_than: 0 }
end
