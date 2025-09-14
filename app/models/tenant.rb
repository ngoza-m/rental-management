class Tenant < ApplicationRecord
  belongs_to :landlord, class_name: "User"
  has_one :property, through: :lease
  has_one :lease, dependent: :destroy
end
