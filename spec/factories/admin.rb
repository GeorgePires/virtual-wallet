FactoryBot.define do
  factory :admin do
    email { 'admin@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end