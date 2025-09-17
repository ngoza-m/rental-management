class Tenant < ApplicationRecord
  belongs_to :landlord, class_name: "User"
  has_many :properties, through: :leases
  has_many :leases, dependent: :destroy
end
