class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|

    t.string "name", null: false
    t.string "telephone_number"
    t.string "email"
    t.string "fax_number"
    t.string "deadline"

      t.timestamps
    end
  end
end
