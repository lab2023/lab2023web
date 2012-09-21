class Admins::ProjectsController < Admins::ApplicationController
  def index
    @projects = Project.paginate(:page => params[:page])
    respond_with(:admins, @projects)
  end

  def show
    @project = Project.find(params[:id])
    respond_with(:admins, @project)
  end

  def new
    @project = Project.new
    respond_with(:admins, @project)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.save
    respond_with(:admins, @project)
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    respond_with(:admins, @project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_with(:admins, @project)
  end
end
