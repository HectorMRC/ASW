class Issue < ApplicationRecord
  validates :userCreator, presence: true
  validates :title, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  validates :issueType, presence: true
  validates :creationDate, presence: true
  
  has_one_attached :file
end
