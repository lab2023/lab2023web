class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    respond_with(@projects)
  end

  def show
    @project = Project.find(params[:id])
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.save
    respond_with(@project)
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    respond_with(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_with(@project)
  end
end
