FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    rol                   "center_admin"
    password              "foobar"
    password_confirmation "foobar"
  end
  
  factory :medical_center do
    name         "Centro Medico"
    address      "Calle Artigas 12345"
    phone_number "473123456"
  end

  factory :doctor do
    name "Bill Cosby"
    email "bill.cosby@mail.com"
    phone_number "099788123"
  end

end
