class AddTeamToQuiz < ActiveRecord::Migration[6.1]
  def change
    add_reference :quizzes, :team, null: false, foreign_key: true
  end
end
