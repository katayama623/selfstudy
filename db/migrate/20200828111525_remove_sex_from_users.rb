class RemoveSexFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sex, :integer
  end
end
