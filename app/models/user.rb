class User < ApplicationRecord
  
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable, 
         :validatable,
         :confirmable
  
  # EMAIL_FORMAT = /[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+/
  
  # validates :title, presence: true
  # validates :email, presence: true, 
  #                   uniqueness: true,
  #                   format: { with: EMAIL_FORMAT }
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: "Test"

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
