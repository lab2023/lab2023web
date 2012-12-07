class PagesController < ApplicationController
  def index
    @projects = Project.limit(4).order("id ASC")
  end

  def stories

  end

  def contact

  end
end
