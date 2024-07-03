class Review < ApplicationRecord
  belongs_to :product

  validates :user_id, presence: true
  validates :rating, presence: true, inclusion: {in: 1..5}
end
