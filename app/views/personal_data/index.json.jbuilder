json.array!(@personal_data) do |personal_datum|
  json.extract! personal_datum, :id, :nickname, :sex, :region, :treasure, :friend_number, :phone_number, :login_password
  json.url personal_datum_url(personal_datum, format: :json)
end
