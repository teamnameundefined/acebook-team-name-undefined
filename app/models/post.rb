class Post < ApplicationRecord
  has_many :comments
  validates :message, presence: true, length: { minimum: 4 }
end
