class Lease < ApplicationRecord
  belongs_to :tenant, class_name: "User"
  belongs_to :property
  # belongs_to :landlord, through: :property
  has_many :payments, dependent: :destroy
end
