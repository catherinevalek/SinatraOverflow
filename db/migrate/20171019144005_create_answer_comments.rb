class CreateAnswerComments < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_comments do |t|
      t.string :body
      t.integer :answer_id
      t.integer :commentor_id

      t.timestamps
    end
  end
end
