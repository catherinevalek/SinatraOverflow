class CreateQuestionVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_votes do |t|
      t.integer :value
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
