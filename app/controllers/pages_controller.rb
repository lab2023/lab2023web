class PagesController < ApplicationController
  def index
    @projects = Project.limit(6).order("id DESC")
  end
end
