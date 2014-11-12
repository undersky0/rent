FactoryGirl.define do
  factory :property do
    cost { Faker::Number.number(9)}
    currentrent { Faker::Number.number(3)}
  end

end
