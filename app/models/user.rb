class User < ApplicationRecord
  
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable, 
         :validatable,
         :confirmable
  
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :author_tests, class_name: "Test"

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
