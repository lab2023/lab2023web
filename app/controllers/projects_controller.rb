class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    respond_with(@projects)
  end

  def show
    @project = Project.find(params[:id])
    respond_with(@project)
  end
end
