FactoryGirl.define do
  factory :order do
    donation nil
    price 1
    status "MyString"
    buyer_name "MyString"
    reference "MyString"
  end
end
