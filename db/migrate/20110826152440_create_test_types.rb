class CreateTestTypes < ActiveRecord::Migration
  def self.up
    create_table :test_types do |t|
      t.string :name
    end
    TestType.enumeration_model_updates_permitted = true
    TestType.create(:name => 'breakfast')
    TestType.create(:name => 'lunch')
    TestType.create(:name => 'dinner')
    TestType.create(:name => 'bedtime')
    TestType.enumeration_model_updates_permitted = false
  end

  def self.down
    drop_table :test_types
  end
end
