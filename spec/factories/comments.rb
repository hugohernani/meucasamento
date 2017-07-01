FactoryGirl.define do
  factory :comment do
    commentable nil
    name "MyString"
    email "MyString"
    content "MyText"
  end
end
