class AddNameCompanyExpertiseToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, default: ""
    add_column :users, :company, :string, default: ""
    add_column :users, :expertise, :string, default: "none"
  end
end
