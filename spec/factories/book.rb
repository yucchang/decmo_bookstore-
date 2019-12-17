FactoryBot.define do
  factory :book do
    title      { Faker::Name.name }
    list_price { [*10..100].sample }
    sell_price { [*10..100].sample }
    page_num   { [*100..200].sample }
    isbn       { SecureRandom.hex(5).upcase }
    isbn13     { SecureRandom.hex(6).upcase }  # SecureRandom.hex => generate a random nums and characters combination
    publisher 
    category 
  end
end

