FactoryGirl.define do
  factory :user do
    name                  "Gustavo Duarte"
    email                 "gus.duarte@gmail.com"
    rol                   "center_admin"
    password              "foobar"
    password_confirmation "foobar"
    medical_center
  end
  
  factory :medical_center do
    name         "Centro Medico"
    address      "Calle Artigas 12345"
    phone_number "473123456"
  end
end
