# Создайте инстанс-метод в модели User, который принимает в качестве аргумента значение 
# уровня сложности и возвращает список всех Тестов, которые проходит или когда-либо проходил 
# Пользователь на этом уровне сложности

class User < ApplicationRecord
  has_many :test_users
  has_many :author_tests, class_name: "Test"
  has_many :tests, through: :test_users

  scope :easy, -> (title) { where(title: title) }

  # def list_of_user_tests(level)
  #   tests.where(level: level)
  # end
end
