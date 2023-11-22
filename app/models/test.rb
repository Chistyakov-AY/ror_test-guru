# Создайте метод класса в модели Test, который возвращает отсортированный по убыванию массив 
# названий всех Тестов у которых Категория называется определённым образом (название категории 
# передается в метод в качестве аргумента).


class Test < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :category
  has_many :questions

  has_many :test_users
  has_many :users, through: :test_users

  def self.tests_by_category(category_title)
    joins(:category).where("categories.title = ?", category_title).order('id DESC')
  end    
end