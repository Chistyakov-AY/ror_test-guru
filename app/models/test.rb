# Создайте метод класса в модели Test, который возвращает отсортированный по убыванию массив 
# названий всех Тестов у которых Категория называется определённым образом (название категории 
# передается в метод в качестве аргумента).


class Test < ApplicationRecord
  validates :title, presence: true

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