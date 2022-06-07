class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      
      t.string "number", null: false
      t.boolean "use", null: false, default: true
      

      t.timestamps
    end
  end
end
