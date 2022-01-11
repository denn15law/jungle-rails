class AddLastNameUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
  end
end
