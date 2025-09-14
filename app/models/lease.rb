class Lease < ApplicationRecord
  belongs_to :tenant
  belongs_to :property
  belongs_to :landlord, class_name: 'User'
end
