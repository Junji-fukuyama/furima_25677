FactoryBot.define do
  factory :pay_form do
    token { 'sampletokensampletoken' }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '博多区' }
    addresses { '中洲１丁目１番１号' }
    building {'テックキャンプ 中洲校'}
    phone_number { '09012345678' }
  end
end