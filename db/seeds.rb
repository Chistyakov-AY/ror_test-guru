# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TestUser.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

u1 = User.create(title: 'Александр')
u2 = User.create(title: 'Владимир')
u3 = User.create(title: 'Денис')

c1 = Category.create(title: 'Backend')
c2 = Category.create(title: 'Frontend')
c3 = Category.create(title: 'Fullstack')

t1 = Test.create(title: 'Ruby on Rails', level: 2, category_id: c1.id, user_id: u1.id)
t2 = Test.create(title: 'Ruby', level: 2, category_id: c3.id, user_id: u2.id)
t3 = Test.create(title: 'HTML', category_id: c3.id, user_id: u3.id)
t4 = Test.create(title: 'Ruby', level: 1, category_id: c1.id, user_id: u1.id)

q1 = Question.create(body: 'Вопрос по Ruby, уровень 1', test_id: t1.id)
q2 = Question.create(body: 'Вопрос по Ruby, уровень 2', test_id: t2.id)
q3 = Question.create(body: 'Вопрос по HTML № 1', test_id: t3.id)

Answer.create(body: 'Ответ по Ruby, уровень 1', question_id: q1.id)
Answer.create(body: 'Ответ по Ruby, уровень 2', question_id: q2.id)
Answer.create(body: 'Ответ по HTML № 1', question_id: q3.id)

TestUser.create(user: u1, test: t1)
TestUser.create(user: u1, test: t2)
TestUser.create(user: u2, test: t2)
TestUser.create(user: u2, test: t3)
TestUser.create(user: u3, test: t3)
TestUser.create(user: u3, test: t4)