class Question < ApplicationRecord
  validates :body, presence: true, uniqueness: true

  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :users, through: :gists
end
