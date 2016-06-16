class HomeController < ApplicationController
  def index
    @stories = Story.fetch("top")
  end
end
