class CreateQuestionComments < ActiveRecord::Migration[5.0]
  def change
    create_table :question_comments do |t|
      t.string :body
      t.integer :question_id
      t.integer :commentor_id

      t.timestamps
    end
  end
end

