class Feedback < ApplicationRecord

  validates :email, presence: true
  validates :text, presence: true
end
