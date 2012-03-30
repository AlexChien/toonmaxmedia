# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_item do
    category_id 1
    news_date "2012-03-08"
    title "MyString"
    source "MyString"
    content "MyText"
  end
end
