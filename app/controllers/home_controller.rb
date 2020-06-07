class HomeController < ApplicationController

  def index
    @webinar = Webinar.new
  end
end
