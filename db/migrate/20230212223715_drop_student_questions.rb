class DropStudentQuestions < ActiveRecord::Migration[6.1]
  def change
    drop_table :student_questions
  end
end
