class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :teacher, :students, :tests

  def teacher
    user = User.find_by!(id: object.id)
    {
      id: user.id,
      name: user.name
    }
  end

  def students
    array = []
    object.student_team.each do |student|
      array.append(
        id: student.user.id,
        name: student.user.name,
        enrollment: student.user.enrollment
      )
    end
    array
  end

  def tests
    array = []
    object.team_quiz.each do |quiz|
      array.append(
        id: quiz.quiz.id,
        name: quiz.quiz.title,
        enrollment: quiz.quiz.subject
      )
    end
    array
  end
end
