json.extract! issue, :id, :userCreator, :idUserAssignee, :title, :description, :issueType, :priority, :status, :votes, :creationDate, :updated, :created_at, :updated_at
json.url issue_url(issue, format: :json)
