class DropStudentQuizzes < ActiveRecord::Migration[6.1]
  def change
    drop_table :student_quizzes
  end
end
