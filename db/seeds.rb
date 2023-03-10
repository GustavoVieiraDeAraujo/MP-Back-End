# -- Admins -- #
User.create(name: 'Mindsu', enrollment: 101_068_666, is_admin: true, is_student: true, is_teacher: true,
            email: 'mindsu@gmail.com', password: '123456789')
User.create(name: 'Eduardo Nakano', enrollment: 102_068_999, is_admin: true, is_student: true, is_teacher: true,
            email: 'nakano@gmail.com', password: '123456789')

# -- Teachers -- #
User.create(name: 'Guy Grebot', enrollment: 211_068_666, is_admin: false, is_student: false, is_teacher: true,
            email: 'grebot@gmail.com', password: '123456789')
User.create(name: 'Jan', enrollment: 211_071_457, is_admin: false, is_student: false, is_teacher: true,
            email: 'janomelhor@gmail.com', password: '123456789')

# -- Students -- #
User.create(name: 'Dissa', enrollment: 211_068_003, is_admin: false, is_student: true, is_teacher: false,
            email: 'dissa@gmail.com', password: '123456789')
User.create(name: 'Caetano', enrollment: 211_068_004, is_admin: false, is_student: true, is_teacher: false,
            email: 'caetano@gmail.com', password: '123456789')
User.create(name: 'Araujo', enrollment: 211_068_002, is_admin: false, is_student: true, is_teacher: false,
            email: 'araujo@gmail.com', password: '123456789')
User.create(name: 'Luiz', enrollment: 211_068_005, is_admin: false, is_student: true, is_teacher: false,
            email: 'luiz@gmail.com', password: '123456789')
User.create(name: 'Alexandre', enrollment: 211_068_006, is_admin: false, is_student: true, is_teacher: false,
            email: 'kiehn.aditya@gmail.com', password: '123456789')
User.create(name: 'Romain', enrollment: 211_068_007, is_admin: false, is_student: true, is_teacher: false,
            email: 'hmueller@gmail.com', password: '123456789')
User.create(name: 'Marques', enrollment: 211_068_008, is_admin: false, is_student: true, is_teacher: false,
            email: 'nyah.mitchell@gmail.com', password: '123456789')
User.create(name: 'Eduardo', enrollment: 211_068_009, is_admin: false, is_student: true, is_teacher: false,
            email: 'noemie.lockman@gmail.com', password: '123456789')
User.create(name: 'Andr??', enrollment: 211_068_010, is_admin: false, is_student: true, is_teacher: false,
            email: 'ignatius77@gmail.com', password: '123456789')

# -- Team -- #
Team.create(name: 'Turma A', user_id: 3)
Team.create(name: 'Turma B', user_id: 4)

# -- Quizes -- #
Quiz.create(title: 'Prova de Soma', subject: 'Matem??tica', user_id: 3, team_id: 1)
Quiz.create(title: 'Prova de Multiplica????o', subject: 'Matem??tica', user_id: 3, team_id: 1)
Quiz.create(title: 'Prova de Conhecimentos Gerais', subject: 'Hist??ria', user_id: 4, team_id: 2)
Quiz.create(title: 'Prova de Soma', subject: 'Matem??tica', user_id: 3, team_id: 1)
Quiz.create(title: 'Prova de Multiplica????o', subject: 'Matem??tica', user_id: 3, team_id: 1)
Quiz.create(title: 'Prova de Conhecimentos Gerais', subject: 'Hist??ria', user_id: 4, team_id: 2)

# -- Questions -- #
Question.create(title: 'Quest??o A', description: 'Quanto ?? 1 + 1?', subject: 'Matem??tica', answer: '2', user_id: 3)
Question.create(title: 'Quest??o B', description: 'Quanto ?? 2 + 2?', subject: 'Matem??tica', answer: '4', user_id: 3)
Question.create(title: 'Quest??o C', description: 'Quanto ?? 4 + 4?', subject: 'Matem??tica', answer: '8', user_id: 3)
Question.create(title: 'Quest??o D', description: 'V ou F: 1 x 1 = 2', subject: 'Matem??tica', answer: 'V', user_id: 3)
Question.create(title: 'Quest??o E', description: 'V ou F: 2 x 2 = 4', subject: 'Matem??tica', answer: 'V', user_id: 3)
Question.create(title: 'Quest??o F', description: 'V ou F: 3 x 2 = 8', subject: 'Matem??tica', answer: 'F', user_id: 3)
Question.create(title: 'Quest??o G', description: 'Qual a cor do cavalo branco de napole??o?
    A - SIM
    B - N??O
    C - BRANCO
    4 - PRETO',
                subject: 'Hist??ria', answer: 'C', user_id: 4)
Question.create(title: 'Quest??o H', description: 'Em que ano o brasil se tornou um pa??s independente?
    A - 2023
    B - 1832
    C - 1822
    4 - NUNCA',
                subject: 'Hist??ria', answer: 'C', user_id: 4)
Question.create(title: 'Quest??o I', description: 'Qual o sentido da vida, o universo e tudo mais?
    A - 42
    B - 24
    C - 4^2
    4 - FRED',
                subject: 'Hist??ria', answer: 'A', user_id: 4)

# -- Quiz Questions -- #

# Quiz - Prova de Soma
(1..3).step(1) do |n|
  QuizQuestion.create(quiz_id: 1, question_id: n)
end
# Quiz - Prova de Multi
(4..6).step(1) do |n|
  QuizQuestion.create(quiz_id: 2, question_id: n)
end
# Quiz - Prova de Conhecimentos Gerais
(7..9).step(1) do |n|
  QuizQuestion.create(quiz_id: 3, question_id: n)
end

# -- Student Teams -- #

# Turma A
(5..9).step(1) do |n|
  StudentTeam.create(user_id: n, team_id: 1)
end
# Turma B
(10..13).step(1) do |n|
  StudentTeam.create(user_id: n, team_id: 2)
end

# -- Team Quizzes -- #

(1..3).step(1) do |n|
  TeamQuiz.create(team_id: 1, quiz_id: n)
end

(1..3).step(1) do |n|
  TeamQuiz.create(team_id: 2, quiz_id: n)
end
