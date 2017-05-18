FactoryGirl.define do
  factory :article do
    title 'Yandex article'
    annotation 'Article annotation'
  end

  factory :custom_article, class: Article do
    title 'Custom article'
    annotation 'Article annotation'
    expired_at { 10.minutes.from_now }
  end
end
