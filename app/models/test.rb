class Test < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :level}
  validates :level, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :category
  has_many :questions

  has_many :test_users
  has_many :users, through: :test_users

  scope :simple_tests, -> {where(level: 0..1)}
  scope :average_tests, -> {where(level: 2..4)}
  scope :difficult_tests, -> {where(level: 5..Float::INFINITY)}
  scope :tests_by_category, ->(category_title) { Test.joins(:category).where("categories.title = ?", category_title ) }
  scope :list_of_level_tests, -> (level) { where(level: level) }

  def self.tests_name_by_category(category_title)
    Test.tests_by_category(category_title).order(title: :DESC)
  end
end