class PagesController < ApplicationController
  def index
    @projects = Project.limit(4).order("id DESC")
  end

  def contact

  end
end
