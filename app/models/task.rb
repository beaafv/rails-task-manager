class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :details, presence: true
end
