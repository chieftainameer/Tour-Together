json.extract! review, :id, :rating, :tour_id, :user_id, :created_at, :updated_at
json.url review_url(review, format: :json)
