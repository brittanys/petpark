json.array!(@postings) do |posting|
  json.extract! posting, :id, :title, :description
  json.url posting_url(posting, format: :json)
end
