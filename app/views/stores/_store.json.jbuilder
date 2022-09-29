json.extract! store, :id, :assembly_id, :user_id, :sub_district_id, :community_id, :sector_id, :serial_number, :digital_address, :purpose_of_structure, :mode_of_structure, :materials_used_for_walls, :address, :is_there_network_mast, :comments, :created_at, :updated_at
json.url store_url(store, format: :json)
