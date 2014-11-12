FactoryGirl.define do
  factory :profile do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    phone {Faker::PhoneNumber.phone_number}
  end

end
