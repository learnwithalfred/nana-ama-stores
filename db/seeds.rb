# frozen_string_literal: true

# 10.times do
#   Assembly.create!(
#     [{
#       name:  Faker::Address.state
#     }])
# end

# 10.times do
#   Community.create!(
#     [{
#       name: Faker::Nation.capital_city
#     }])
# end

#   Sector.create!(
#     [{
#       name:  "Urban"
#     }])
# end

# 5.times do
#   Sector.create!(
#     [{
#        name: Faker::Nation.capital_city
#     }])
# end

# 40.times do
#   User.create!(
#     [{
#       name:  Faker::Name.name,
#       email: Faker::Internet.email,
#       password: "welcome",
#       password_confirmation: "welcome",
#       gender: Faker::Gender.binary_type,
#       address: Faker::Address.community,
#       role: Faker::Number.between(from: 1, to: 4)
#     }])
# end

# class_num = 0;
# 70.times do
#   Store.create!(
#     [{
#       assembly_id:  Faker::Number.between(from: 1, to: 3),
#       user_id: Faker::Number.between(from: 1, to: 3),
#       sub_district_id: Faker::Number.between(from: 1, to: 3),
#       community_id: Faker::Number.between(from: 1, to: 3),
#       sector_id: Faker::Number.between(from: 1, to: 3),
#       digital_address: "AK-0258-90#{class_num}",
#       serial_number: "ST-0208-00#{class_num}",
#       purpose_of_structure: Faker::Lorem.paragraph(sentence_count: 2),
#       mode_of_structure: "Metal",
#       materials_used_for_walls: "Metal",
#       address: Faker::Address.street_address,
#       is_there_network_mast: true,
#       comments: Faker::Lorem.paragraph(sentence_count: 1),
#   }])
# end

# 200.times do
#   Tax.create!(
#     [{
#       user_id: Faker::Number.between(from: 1, to: 3),
#       name:  Faker::Lorem.paragraph(sentence_count: 1),
#       description: Faker::Lorem.paragraph(sentence_count: 2),
#       amount: Faker::Number.between(from: 1000, to: 9000),
#       year: Faker::Number.between(from: 2022, to: 2023),
#       store_id: Faker::Number.between(from: 1, to: 30),
#    }])
# end

# other users
100.times do
  Payment.create!(
    [{
      user_id: Faker::Number.between(from: 1, to: 3),
      amount: Faker::Number.between(from: 1000, to: 9000),
      store_id: Faker::Number.between(from: 1, to: 20),
      payee: Faker::Name.name,
      tax_id: Faker::Number.between(from: 100, to: 200)
    }])
end
