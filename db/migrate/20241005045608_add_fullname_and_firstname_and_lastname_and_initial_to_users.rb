class AddFullnameAndFirstnameAndLastnameAndInitialToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :fullname, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :initial, :string
  end
end
