FactoryBot.define do
  factory :card do
    card_token { 'tok_a529d4f05a5b0fcf10e399304de8' }
    customer_token {'cus_f059cb0ac6c2301ac765e8c8191a'}
    association :user
  end
end
