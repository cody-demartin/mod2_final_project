class RemoveCompanyFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :company
  end
end
