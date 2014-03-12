class Patient < ActiveRecord::Base
  belongs_to :medical_center

  def self.search(search, user)
    if search
      where('name LIKE ?', "%#{search}%")  
    else
      Patient.all
    end
  end

  def self.find_by_user(user)
    where('medical_center_id LIKE ?', "%#{user.medical_center.id}%")
  end
end
 
