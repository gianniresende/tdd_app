class AddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :smoker, :string
    add_column :customers, :phone, :string
    add_column :customers, :avatar, :string 
  end 
end
