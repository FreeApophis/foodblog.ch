json.extract! image, :id, :file, :name, :description, :size, :created_at, :updated_at
json.url image_url(image, format: :json)