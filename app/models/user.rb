require 'digest/sha1'

class User < ApplicationRecord
  validates :title, presence: true
  validates :email, presence: true, uniqueness: true
  
  # include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: "Test"

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
