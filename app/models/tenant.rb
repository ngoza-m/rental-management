class Tenant < ApplicationRecord
  belongs_to :landlord, class_name: "User"
end
