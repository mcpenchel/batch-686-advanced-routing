class Review < ApplicationRecord
  belongs_to :restaurant

  validates :description, length: { minimum: 10 }

end
