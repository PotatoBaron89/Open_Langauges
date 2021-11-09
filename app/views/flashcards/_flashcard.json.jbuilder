json.extract! flashcard, :id, :side_one, :side_two, :created_at, :updated_at
json.url flashcard_url(flashcard, format: :json)
json.side_one flashcard.side_one.to_s
json.side_two flashcard.side_two.to_s
