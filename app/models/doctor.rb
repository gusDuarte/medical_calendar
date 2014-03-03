class Doctor < ActiveRecord::Base
  belongs_to :medical_center
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")  
    else
      scoped
    end
  end

end
