json.array!(@users) do |user|
  json.extract! user, :lat, :lon
  #json.url user_url(user, format: :jsonp)
end
