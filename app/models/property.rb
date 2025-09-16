class Property < ApplicationRecord
  belongs_to :landlord, class_name: "User"
  has_many :leases, dependent: :destroy
  has_many :tenants, through: :leases

  validates :name, presence: true
  validates :address, presence: true
  validates :rent, presence: true, numericality: { greater_than: 0 }
end
