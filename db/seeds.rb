# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
BloodTest.create([
                  { :test_date => '2011-08-30', :test_type_id => 4, :result => 83},
                  { :test_date => '2011-08-31', :test_type_id => 1, :result => 12},
                  { :test_date => '2011-08-31', :test_type_id => 3, :result => 87},
                  { :test_date => '2011-08-31', :test_type_id => 4, :result => 99},
                  { :test_date => '2011-09-01', :test_type_id => 1, :result => 98},
                  { :test_date => '2011-09-01', :test_type_id => 3, :result => 15},
                  { :test_date => '2011-09-01', :test_type_id => 4, :result => 86},
                  { :test_date => '2011-09-02', :test_type_id => 1, :result => 11}
                 ])


