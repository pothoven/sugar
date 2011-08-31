class BloodTest < ActiveRecord::Base

  belongs_to :test_type

  validates_uniqueness_of :test_date, :scope => [:test_type_id]
  validates_presence_of :result

  default_scope order(:test_date, :test_type_id)

  scope :breakfast, joins(:test_type).where("test_types.name = 'breakfast'")
  scope :lunch, joins(:test_type).where("test_types.name = 'lunch'")
  scope :dinner, joins(:test_type).where("test_types.name = 'dinner'")
  scope :bedtime, joins(:test_type).where("test_types.name = 'bedtime'")
  scope :test_type, lambda { |*args| { :conditions => "test_type_id = #{TestType[args.first].id}" } }

  scope :recent, lambda { |*args| {:conditions => ["test_date > ?", (args.first || 1.week.ago)] } }


end
