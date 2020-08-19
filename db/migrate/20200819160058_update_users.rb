class UpdateUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :expertise
    add_column :users, :expertise, :string, default: ""
  end
end
