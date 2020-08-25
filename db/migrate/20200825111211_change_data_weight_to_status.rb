class ChangeDataWeightToStatus < ActiveRecord::Migration[5.2]
  def change
  	change_column :statuses, :weight, :float
  end
end
