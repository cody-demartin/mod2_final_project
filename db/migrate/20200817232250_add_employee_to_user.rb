class AddEmployeeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :employee, :boolean, default: false
  end
end
