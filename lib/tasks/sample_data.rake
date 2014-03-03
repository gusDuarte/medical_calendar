namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    mc = MedicalCenter.create!(name: "Centro Medico", 
    		               address: "Articas 1234",
			       phone_number: "47330900")
    
    mc.users.create!(name: "Gustavo Duarte",
                     email: "gus.duarte@gmail.com",
	             rol: "center_admin",
                     password: "foobar",
                     password_confirmation: "foobar")

    99.times do |n|
      name  = Faker::Name.name
      email = "gustavo#{n+1}@gmail.com"
      phone_number  = "12300#{n+1}"
      mc.doctors.create!(name: name,
                       email: email,
                       phone_number: phone_number )
    end
  end
end