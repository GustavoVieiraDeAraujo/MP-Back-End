class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :students

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
end
