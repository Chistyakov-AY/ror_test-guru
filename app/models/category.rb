class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  
  has_many :tests
  default_scope { order(id: :ASC) }
end
