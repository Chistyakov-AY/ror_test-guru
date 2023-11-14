# Создайте инстанс-метод в модели User, который принимает в качестве аргумента значение 
# уровня сложности и возвращает список всех Тестов, которые проходит или когда-либо проходил 
# Пользователь на этом уровне сложности

class User < ApplicationRecord

  def list_of_user_tests(level)
    Test.joins(category: :user).where(level: level).where("users.id = #{id}")
  end
end
