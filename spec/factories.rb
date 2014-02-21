FactoryGirl.define do
  factory :user do
    name                  "Gustavo Duarte"
    email                 "gus.duarte@gmail.com"
    rol                   "recepcionist"
    medical_center        "Acme Medical Center"
    password              "foobar"
    password_confirmation "foobar"
  end
end
