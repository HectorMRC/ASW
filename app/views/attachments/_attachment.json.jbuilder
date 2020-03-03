json.extract! attachment, :id, :idIssue, :file, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
