class CreateBloodTests < ActiveRecord::Migration
  def self.up
    create_table :blood_tests do |t|
      t.date :test_date
      t.integer :test_type_id, :limit => 2
      t.integer :result, :limit => 3
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :blood_tests
  end
end
