# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

u1 = User.create(title: 'Александр', email: 'alex@mail.ru')
# u2 = User.create(title: 'Владимир', email: 'vlad@gmail.ru', password_digest: '2')
# u3 = User.create(title: 'Денис', email: 'dan@yandex.ru', password_digest: '3')

c1 = Category.create(title: 'Backend')
c2 = Category.create(title: 'Frontend')
c3 = Category.create(title: 'Fullstack')

t1 = Test.create(title: 'Ruby', level: 1, category_id: c1.id, user_id: u1.id)
t2 = Test.create(title: 'Java', level: 2, category_id: c3.id, user_id: u1.id)
t3 = Test.create(title: 'HTML', category_id: c2.id, user_id: u1.id)
t4 = Test.create(title: 'Go', level: 3, category_id: c1.id, user_id: u1.id)

q1 = Question.create(body: 'Как преобразовать переменную из строки в символ?', test_id: t1.id)
q2 = Question.create(body: 'Как соединить два массива в ruby?', test_id: t1.id)
q3 = Question.create(body: 'Вопрос по Java №1', test_id: t2.id)
q4 = Question.create(body: 'Вопрос по Java №2', test_id: t2.id)
q5 = Question.create(body: 'Вопрос по HTML №1', test_id: t3.id)
q6 = Question.create(body: 'Вопрос по HTML №2', test_id: t3.id)
q7 = Question.create(body: 'Вопрос по GO №1', test_id: t4.id)
q8 = Question.create(body: 'Вопрос по GO №2', test_id: t4.id)

Answer.create(body: 'С помощью метода intern() и to_sym()', question_id: q1.id, correct: true)
Answer.create(body: 'С помощью метода to_i()', question_id: q1.id)
Answer.create(body: 'Так нельзя сделать', question_id: q1.id)
Answer.create(body: 'С помощью метода concat()', question_id: q2.id, correct: true)
Answer.create(body: 'Нельзя соединить два массива', question_id: q2.id)
Answer.create(body: 'С помощью метода +', question_id: q2.id, correct: true)
Answer.create(body: 'Ответ по HTML', question_id: q5.id)
Answer.create(body: 'Ответ по HTML, уровень 3', question_id: q4.id)