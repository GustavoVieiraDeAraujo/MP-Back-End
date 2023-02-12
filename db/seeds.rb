# Administrador
Statistic.create!(questions_answered: 5, right_answers: 3, wrong_answers: 2)
Statistic.create!(questions_answered: 6, right_answers: 4, wrong_answers: 2)

# 1
User.create(name:"Jan a Lenda", enrollment:100000001, is_admin:true, is_student:false, is_teacher:false, email:"janalendademp@jan.com", password:"janomelhor", statistic_id: 1 )

# Alunos

# 2
User.create(name:"De sá trepa no C.A", enrollment:100000002, is_admin:false, is_student:true, is_teacher:false, email:"desátrancouc.a@ffdesá.com", password:"foguetenãodáré", statistic_id: 2)
# 3
User.create(name:"Caetano Rei Delas", enrollment:100000003, is_admin:false, is_student:true, is_teacher:false, email:"caetanosocafofo@infiel.com", password:"soudelaseparaelas")
# 4
User.create(name:"Luiz matador de aula", enrollment:100000004, is_admin:false, is_student:true, is_teacher:false, email:"teste1@teste1.com", password:"teste1", statistic_id: 1)
# 5
User.create(name:"Fernado sem soracaba", enrollment:100000005, is_admin:false, is_student:true, is_teacher:false, email:"teste2@teste2.com", password:"teste2")
# 6
User.create(name:"Saudades de vc de Sá", enrollment:10000006, is_admin:false, is_student:true, is_teacher:false, email:"teste3@teste3.com", password:"teste3")
# 7
User.create(name:"Matue e teto é bão d+", enrollment:100000007, is_admin:false, is_student:true, is_teacher:false, email:"teste4@teste4.com", password:"teste4")
# 8
User.create(name:"Foguete não da ré", enrollment:100000008, is_admin:false, is_student:true, is_teacher:false, email:"teste5@teste5.com", password:"teste5")

# Professores

# 9
User.create(name:"deutrano 1", enrollment:100000009, is_admin:false, is_student:false, is_teacher:true, email:"deutrano1@deutrano1.com", password:"teste1")
# 10
User.create(name:"ciclano 1", enrollment:100000010, is_admin:false, is_student:false, is_teacher:true, email:"ciclano1@ciclano1.com", password:"teste2")
# 11
User.create(name:"fulano 1", enrollment:100000011, is_admin:false, is_student:false, is_teacher:true, email:"fulano1@fulano1.com", password:"teste3")
# 12
User.create(name:"deutrano 2", enrollment:100000012, is_admin:false, is_student:false, is_teacher:true, email:"deutrano2@deutrano2.com", password:"teste4")
# 13
User.create(name:"ciclano 2", enrollment:10000013, is_admin:false, is_student:false, is_teacher:true, email:"ciclano2@ciclano2.com", password:"teste5")
# 14
User.create(name:"fulano 2", enrollment:100000014, is_admin:false, is_student:false, is_teacher:true, email:"fulano2@fulano2.com", password:"teste6")
# 15
User.create(name:"indeterminado", enrollment:100000015, is_admin:false, is_student:false, is_teacher:true, email:"indeterminado@indeterminado.com", password:"teste7")

# Turmas

# 1
Team.create(name:"A", user_id: 9)
# 2
Team.create(name:"B", user_id: 10)
# 3
Team.create(name:"C", user_id: 11)
# 4
Team.create(name:"D", user_id: 12)
# 5
Team.create(name:"E", user_id: 13)
# 6
Team.create(name:"F", user_id: 14)
# 7
Team.create(name:"G", user_id: 15)

# Questões

# 1
Question.create(title:"quest 1", description:"descrip 1", subject:"subj 1", answer:"ans 1", user_id:9)
# 2
Question.create(title:"quest 2", description:"descrip 2", subject:"subj 2", answer:"ans 2", user_id:10)
# 3
Question.create(title:"quest 3", description:"descrip 3", subject:"subj 3", answer:"ans 3", user_id:11)
# 4
Question.create(title:"quest 4", description:"descrip 4", subject:"subj 4", answer:"ans 4", user_id:12)
# 5
Question.create(title:"quest 5", description:"descrip 5", subject:"subj 5", answer:"ans 5", user_id:13)
# 6
Question.create(title:"quest 6", description:"descrip 6", subject:"subj 6", answer:"ans 6", user_id:14)
# 7
Question.create(title:"quest 7", description:"descrip 7", subject:"subj 7", answer:"ans 7", user_id:15)


# Provas

# 1
Quiz.create(title:"title 1", subject:"subj 1", user_id:9, team_id:1)
# 2
Quiz.create(title:"title 2", subject:"subj 2", user_id:10, team_id:2)
# 3
Quiz.create(title:"title 3", subject:"subj 3", user_id:11, team_id:3)
# 4
Quiz.create(title:"title 4", subject:"subj 4", user_id:12, team_id:4)
# 5
Quiz.create(title:"title 5", subject:"subj 5", user_id:13, team_id:5)
# 6
Quiz.create(title:"title 6", subject:"subj 6", user_id:14, team_id:6)
# 7
Quiz.create(title:"title 7", subject:"subj 7", user_id:15, team_id:7)

# Acrescentar alunos nas turmas

# Turma A
(2..8).step(1) do |n|
    StudentTeam.create(user_id:n, team_id:1)
end

# Turma B
(2..8).step(1) do |n|
    StudentTeam.create(user_id:n, team_id:2)
end

# Turma C
(2..8).step(1) do |n|
    StudentTeam.create(user_id:n, team_id:3)
end

# Turma D
(2..8).step(1) do |n|
    StudentTeam.create(user_id:n, team_id:4)
end

# Turma E
(2..8).step(1) do |n|
    StudentTeam.create(user_id:n, team_id:5)
end

# Turma F
(2..8).step(1) do |n|
    StudentTeam.create(user_id:n, team_id:6)
end

# Turma G
(2..8).step(1) do |n|
    StudentTeam.create(user_id:n, team_id:7)
end