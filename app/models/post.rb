class Post < ApplicationRecord
  validates :message, presence: true, length: { minimum: 4 }
end
