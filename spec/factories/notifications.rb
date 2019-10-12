FactoryBot.define do
  factory :notification do
    notifyable_id { 1 }
    notifyable_type { "MyString" }
    message { "MyString" }
  end
end
