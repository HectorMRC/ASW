class Vote < ApplicationRecord
  validates :user, presence: true
  validates :issue, presence: true
end
