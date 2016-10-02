class RemoveHealthFromPerson < ActiveRecord::Migration
  def self.up
    remove_column :people, :health
  end
end
