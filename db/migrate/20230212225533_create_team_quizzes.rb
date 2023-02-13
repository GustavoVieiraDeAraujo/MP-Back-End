class CreateTeamQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :team_quizzes do |t|
      t.references :team, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
