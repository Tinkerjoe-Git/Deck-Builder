class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :deck

  validates :content, presence: true
end
