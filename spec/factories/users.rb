FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
    password { "secret" }
    password_confirmation { "secret" }

    salt { salt = "asdasdastr4325234324sdfds" }
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("secret", salt) }
  end
end
