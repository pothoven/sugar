class TestType < ActiveRecord::Base
  acts_as_enumerated

  def TestType.for_select
    test_types = TestType.all.collect{|t| [t.name, t.id] }
    return test_types
  end

  def to_s
    self.name
  end
end
