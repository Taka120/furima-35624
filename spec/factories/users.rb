FactoryBot.define do
  factory :user do
    nickname {"太朗"}
    email {"taro@test.com"}
    password {"t12345"}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"太朗"}
    last_name_reading {"ヤマダ"}
    first_name_reading {"タロウ"}
    birthday {"1990-01-01"}
  end
end
