json.extract! agenda, :id, :agenda_item, :is_complete, :created_at, :updated_at
json.url agenda_url(agenda, format: :json)
