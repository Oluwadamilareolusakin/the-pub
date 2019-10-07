FactoryBot.define do
  factory :like do
    likeable_id { 1 }
    likeable_type { "Image" }
    user { user }
  end
end
