class Doctor < ActiveRecord::Base
  belongs_to :medical_center
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

  def self.search(search, user)
    if search
      where('name LIKE ?', "%#{search}%")  
    else
      Doctor.all
    end
  end

  def self.find_by_user(user)
    where('medical_center_id LIKE ?', "%#{user.medical_center.id}%")
  end
end
