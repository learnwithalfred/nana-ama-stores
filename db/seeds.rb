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
#       password: "password",
#       password_confirmation: "password",
#       gender: Faker::Gender.binary_type,
#       address: Faker::Address.community,
#       role: Faker::Number.between(from: 1, to: 5)
#     }])
# end

# class_num = 100
# 300.times do
#   class_num = class_num + 1
#   Store.create!(
#     [{
#       assembly_id:  Faker::Number.between(from: 1, to: 3),
#       user_id: Faker::Number.between(from: 1, to: 3),
#       sub_district_id: Faker::Number.between(from: 1, to: 3),
#       community_id: Faker::Number.between(from: 1, to: 3),
#       sector_id: Faker::Number.between(from: 1, to: 3),
#       digital_address: "AK-825-80#{class_num}",
#       serial_number: "ST-320-70#{class_num}",
#       purpose_of_structure: Faker::Lorem.paragraph(sentence_count: 2),
#       mode_of_structure: "Metal",
#       materials_used_for_walls: "Metal",
#       address: Faker::Address.street_address,
#       is_there_network_mast: true,
#       comments: Faker::Lorem.paragraph(sentence_count: 1)
#   }])
# end

# class_num = 277
# 290.times do
#   class_num = class_num + 1
#   Tax.create!(
#     [{
#       user_id: Faker::Number.between(from: 1, to: 3),
#       name:  Faker::Lorem.paragraph(sentence_count: 1),
#       description: Faker::Lorem.paragraph(sentence_count: 2),
#       amount: Faker::Number.between(from: 1000, to: 9000),
#       year: Faker::Number.between(from: 2021, to: 2024),
#       store_id: class_num
#    }])
# end

# class_num = 277
# tax_num = 413
# 200.times do
#   class_num = class_num + 1
#   tax_num = tax_num + 1
#   Payment.create!(
#     [{
#       user_id: Faker::Number.between(from: 1, to: 3),
#       amount: Faker::Number.between(from: 1000, to: 9000),
#       store_id: class_num,
#       payee: Faker::Name.name,
#       tax_id: tax_num
#     }])
# end
