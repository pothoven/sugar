class ApplicationController < ActionController::Base
  protect_from_forgery

  caches_page :index

end
