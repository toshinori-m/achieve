class Report < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :location, :time, :condition, :intensity, presence: true, length: { maximum: 140 }
  validates :report ,:point, presence: true, length: { maximum: 250 }
end
