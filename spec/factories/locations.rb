FactoryGirl.define do
  factory :location do
    address {Faker::Address.street_name}
    google_address {Faker::Address.street_name}
    postcode {Faker::Address.postcode}
    latitude {Faker::Address.latitude}
    longitude {Faker::Address.longitude}
  end
end
