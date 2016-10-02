class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.text :rules_applied
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
