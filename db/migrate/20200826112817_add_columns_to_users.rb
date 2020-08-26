class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :sex, :integer
  	add_column :users, :height, :float
  	add_column :users, :message, :string
  end
end
