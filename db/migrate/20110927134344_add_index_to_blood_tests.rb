class AddIndexToBloodTests < ActiveRecord::Migration
  def change
    add_index :blood_tests, :test_date
  end
end
