class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { super_admin: 0, landlord: 1, tenant: 2 }

  has_many :properties, foreign_key: :landlord_id
  has_many :tenants, foreign_key: :landlord_id
  has_many :leases, through: :tenants
end
