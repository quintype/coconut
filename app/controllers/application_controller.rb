class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_config
  def load_config
    @config = QtConfig.get
  end

  after_filter :add_caching_headers
  def add_caching_headers
    if @cache_keys
      response.headers["Cache-Control"] = "public,max-age=0"
      response.headers["Surrogate-Control"] = "public,max-age=60,stale-while-revalidate=300,stale-while-error=3600"
      response.headers["Surrogate-Key"] = @cache_keys.join(" ")
      response.headers["Vary"] = "Accept-Encoding"
    end
  end
end
