FactoryBot.define do
    factory :user do
      email                       {"amagami@example.com"}
      password                    {"password"}
      password_confirmation       {"password"}
    end
end