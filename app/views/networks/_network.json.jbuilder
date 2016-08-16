json.extract! network, :id, :name, :title, :content, :pwd, :ssid, :created_at, :updated_at
json.url network_url(network, format: :json)