class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.integer :age
      t.integer :gender
      t.string :location
      t.text :health

      t.timestamps null: false
    end
  end
end
