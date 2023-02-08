class CreateStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics do |t|
      t.integer :questions_answered
      t.integer :right_answers
      t.integer :wrong_answers

      t.timestamps
    end
  end
end
