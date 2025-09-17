class Payment < ApplicationRecord
  belongs_to :lease
  belongs_to :tenant, class_name: 'User'

  enum status: { pending: 0, paid: 1, overdue: 2 }
end
