# Создайте инстанс-метод в модели User, который принимает в качестве аргумента значение 
# уровня сложности и возвращает список всех Тестов, которые проходит или когда-либо проходил 
# Пользователь на этом уровне сложности

class User < ApplicationRecord
  has_many :test_users
  has_many :tests
  has_many :tests, through: :test_users

  def list_of_user_tests(level)
    #Test.joins("INNER JOIN categories ON categories.id = tests.category_id INNER JOIN users ON categories.user_id = users.id").where("tests.level = #{level}")
    tests.where(level: level)
  end
end
