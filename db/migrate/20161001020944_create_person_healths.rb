class CreatePersonHealths < ActiveRecord::Migration
  def change
    create_table :person_healths do |t|
      t.string :condition
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
