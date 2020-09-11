FactoryBot.define do
  factory :order_address do
    token { 'syunkungoodnatyudon11' }
    postal_code { '444-0122' }
    prefecture_id { '2' }
    municipalitie { '幸田町六栗' }
    address { '八幡27-10' }
    phone_number { '09045406953' }
  end
end
