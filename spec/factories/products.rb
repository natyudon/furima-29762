FactoryBot.define do
  factory :product do
    name {'釣り道具'}
    content {'釣り釣り釣り釣り'}
    price {2000}
    category_id {3}
    state_id {3}
    delivery_fee_id {2}
    area_id {2}
    delivery_day_id {2}
  end
end
