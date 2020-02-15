class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :inquiry, foreign_key: true
      t.text	   :answer
      t.timestamps
    end
  end
end
