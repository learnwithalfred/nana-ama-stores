# frozen_string_literal: true

# 10.times do
#   Assembly.create!(
#     [{
#       name: Faker::Address.state,
#     }]
#   )
# end

# 10.times do
#   Community.create!(
#     [{
#       name: Faker::Nation.capital_city,
#     }]
#   )
# end

# 10.times do
#   SubDistrict.create!(
#     [{
#       name: Faker::Nation.capital_city,
#     }]
#   )
# end

# 5.times do
#   Sector.create!(
#     [{
#       name: Faker::Nation.capital_city,
#     }]
#   )
# end

admin_num = 1
5.times do
  admin_num = admin_num + 1
  User.create!(
    [{
      name: Faker::Name.name,
      email: "admin#{admin_num}@test.com",
      password: "secrete",
      password_confirmation: "secrete",
      gender: Faker::Gender.binary_type,
      address: Faker::Address.community,
      role: "admin",
    }]
  )
end

40.times do
  User.create!(
    [{
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password",
      gender: Faker::Gender.binary_type,
      address: Faker::Address.community,
      role: Faker::Number.between(from: 1, to: 6),
    }]
  )
end

class_num = 100
300.times do
  class_num = class_num + 1
  Store.create!(
    [{
      assembly_id: Assembly.all.sample.id,
      user_id: User.where(role: "collector").sample.id,
      sub_district_id: SubDistrict.all.sample.id,
      community_id: Community.all.sample.id,
      sector_id: Sector.all.sample.id,
      digital_address: "AK-289-1#{class_num}",
      serial_number: "ST-000-3#{class_num}",
      purpose_of_structure: Faker::Lorem.paragraph(sentence_count: 2),
      mode_of_structure: "Metal",
      materials_used_for_walls: "Metal",
      address: Faker::Address.street_address,
      is_there_network_mast: true,
      comments: Faker::Lorem.paragraph(sentence_count: 1),
    }]
  )
end

300.times do
  Tax.create!(
    [{
      user_id: User.where(role: "collector").sample.id,
      name: Faker::Lorem.paragraph(sentence_count: 1),
      description: Faker::Lorem.paragraph(sentence_count: 2),
      amount: Faker::Number.between(from: 1000, to: 9000),
      year: Faker::Number.between(from: 2021, to: 2024),
      store_id: Store.all.sample.id,
    }]
  )
end

200.times do
  Payment.create!(
    [{
      user_id: User.where(role: "collector").sample.id,
      amount: Faker::Number.between(from: 1000, to: 9000),
      store_id: Store.all.sample.id,
      payee: Faker::Name.name,
      tax_id: Tax.all.sample.id,
    }]
  )
end
