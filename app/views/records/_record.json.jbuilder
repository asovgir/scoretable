json.extract! record, :id, :wins, :losses, :user_id, :category_id, :created_at, :updated_at
json.url record_url(record, format: :json)
