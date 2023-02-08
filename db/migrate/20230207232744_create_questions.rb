class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.string :subject
      t.string :answer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
