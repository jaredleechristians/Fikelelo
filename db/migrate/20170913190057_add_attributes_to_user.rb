class AddAttributesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
  end
end
