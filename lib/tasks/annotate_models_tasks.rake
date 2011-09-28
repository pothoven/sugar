desc "Add schema information (as comments) to model files"

namespace :db do
  task :annotate do
    require File.join(File.dirname(__FILE__), "../annotate_models.rb")
    AnnotateModels.do_annotations
  end
end
