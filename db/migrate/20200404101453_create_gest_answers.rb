class CreateGestAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :gest_answers do |t|
      t.references :gest_inquiry_id, foreign_key: true
      t.text :gest_answer

      t.timestamps
    end
  end
end
