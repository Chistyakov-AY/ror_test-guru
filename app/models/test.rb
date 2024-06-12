class Test < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :level}
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy
  
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :category
  has_many :questions, dependent: :destroy

  scope :publication, -> { where(publication: true) }
  scope :list_of_level_tests, -> (level) { where(level: level) }
  scope :simple_tests, -> { list_of_level_tests(0..1) }
  scope :average_tests, -> { list_of_level_tests(2..4) }
  scope :difficult_tests, -> { list_of_level_tests(5..Float::INFINITY) }
  scope :tests_by_category, ->(category_title) { Test.joins(:category).where("categories.title = ?", category_title ) }

  def self.tests_name_by_category(category_title)
    Test.tests_by_category(category_title).order(title: :DESC)
  end
end