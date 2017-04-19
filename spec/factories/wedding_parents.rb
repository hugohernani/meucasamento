FactoryGirl.define do
  factory :wedding_parent, class: 'WeddingParents' do
    fiance nil
    father_name "MyString"
    father_description "MyText"
    mother_name "MyString"
    mother_description "MyText"
  end
end
