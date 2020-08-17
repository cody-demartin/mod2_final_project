class AddQuestionIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :question_id, :integer
  end
end
