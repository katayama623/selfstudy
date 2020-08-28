class Users < ActiveRecord::Migration[5.2]
  def down
  	remove_column :users, :sex, :integer
  	remove_column :users, :height, :float
  	remove_column :users, :message, :string
  end
end
