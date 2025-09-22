class Lease < ApplicationRecord
  belongs_to :tenant, class_name: "User"
  belongs_to :property
  # belongs_to :landlord, through: :property
  has_many :payments, dependent: :destroy

  enum status: { active: 0, pending: 1, terminated: 2 }
end
