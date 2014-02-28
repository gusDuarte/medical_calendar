class MedicalCenter < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  VALID_PHONE_NUMB_REGEX = /\A[0-9]*\Z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMB_REGEX }, uniqueness: { case_sensitive: false }
  
  has_many :doctors
  has_many :users
end
