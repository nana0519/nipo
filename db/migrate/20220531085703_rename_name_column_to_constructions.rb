class RenameNameColumnToConstructions < ActiveRecord::Migration[6.1]
  def change
    rename_column :constructions, :name, :construction_name
  end
end
