FactoryBot.define do
  factory :wallet do
    association :user
    association :transactions
  end
end