require 'faker'

10.times do
  doc = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: Faker::Military.marines_rank, postal_code: Faker::Address.postcode)
end

20.times do
  pat = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

50.times do
  a = Appointment.new
  a.assign_attributes({date: Faker::Date.between(2.days.ago, Date.today)})
  a.patient = Patient.all.sample
  a.doctor = Doctor.all.sample
  a.save
end
