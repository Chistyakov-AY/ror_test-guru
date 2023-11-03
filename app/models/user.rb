# Создайте инстанс-метод в модели User, который принимает в качестве аргумента значение 
# уровня сложности и возвращает список всех Тестов, которые проходит или когда-либо проходил 
# Пользователь на этом уровне сложности

class User < ApplicationRecord
  has_many :categories

  def list_of_user_tests(level)
    categories.map(&:tests).flatten.select { |x| x.level == level }
  end
end
