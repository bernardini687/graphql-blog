FactoryBot.define do
  factory :post do
    sequence :body do |n|
      "Mikamai#{n}"
    end
    user
  end
end
