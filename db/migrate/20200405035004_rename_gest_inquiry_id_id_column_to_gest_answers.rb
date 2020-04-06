class RenameGestInquiryIdIdColumnToGestAnswers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :gest_answers, :gest_inquiry_id_id, :gest_inquiry_id
  end
end
