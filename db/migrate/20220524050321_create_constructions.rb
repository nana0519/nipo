class CreateConstructions < ActiveRecord::Migration[6.1]
  def change
    create_table :constructions do |t|

      t.string "name", null: false
      t.text "content"
      t.boolean "contract", null: false, default: true
      t.string "address"
      t.timestamps
    end
  end
end
