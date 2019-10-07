FactoryBot.define do
  factory :comment do
    commentable_id { 1 }
    commentable_type { "Image" }
    user { user }
  end
end
