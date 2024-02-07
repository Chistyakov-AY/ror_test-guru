class User < ApplicationRecord
  
  validates :title, presence: true
  validates :email, presence: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: "Test"
  # has_many :test_users
  # has_many :tests, through: :test_users

  scope :easy, -> (title) { where(title: title) }

  def list_of_user_tests(level)
    tests.list_of_level_tests(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
