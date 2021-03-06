# == Schema Information
# Schema version: 20110927134344
#
# Table name: blood_tests
#
#  id           :integer         not null, primary key
#  test_date    :date
#  test_type_id :integer
#  result       :integer
#  note         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class BloodTest < ActiveRecord::Base

  belongs_to :test_type

  validates_uniqueness_of :test_date, :scope => [:test_type_id]
  validates_presence_of :result
  validates_numericality_of :result, :only_integer => true, :greater_then_or_equal_to => 0
  validates_presence_of :test_date
  validates_presence_of :test_type_id

  default_scope order(:test_date, :test_type_id)

  scope :breakfast, joins(:test_type).where("test_types.name = 'breakfast'")
  scope :lunch, joins(:test_type).where("test_types.name = 'lunch'")
  scope :dinner, joins(:test_type).where("test_types.name = 'dinner'")
  scope :bedtime, joins(:test_type).where("test_types.name = 'bedtime'")
  scope :test_type, lambda { |*args| { :conditions => "test_type_id = #{TestType[args.first].id}" } }

  scope :recent, lambda { |*args| {:conditions => ["test_date > ?", (args.first || (BloodTest.last.test_date - 3.months))] } }


end
