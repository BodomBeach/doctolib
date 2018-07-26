require 'faker'

5.times do
  city = City.create(city_name: Faker::LeagueOfLegends.location)
end

10.times do
  spec = Specialty.create(name: Faker::Military.marines_rank)
end

10.times do
  doc = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, postal_code: Faker::Address.postcode, city_id: City.all.sample.id)
end

20.times do
  pat = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
end

50.times do
  a = Appointment.new
  a.assign_attributes({date: Faker::Date.between(2.days.ago, Date.today), city_id: City.all.sample.id})
  a.patient = Patient.all.sample
  a.doctor = Doctor.all.sample
  a.save
end
