class AddStatusToConstructions < ActiveRecord::Migration[6.1]
  def change
    add_column :constructions, :status, :boolean, default: false
  end
end
