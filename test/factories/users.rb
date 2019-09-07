FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "John#{n}"
    end
    last_name { 'Doe' }
    street { 'Via Magenta' }
    number { '4' }
    city { 'Milano' }
    postcode { '28822' }
    country { 'Italia' }
  end
end
