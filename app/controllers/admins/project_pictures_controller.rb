class Admins::ProjectPicturesController < Admins::ApplicationController
  before_filter :find_project
  def index
    @project_pictures = @project.project_pictures

    respond_with(:admins, @project_pictures)
  end


  def create
    @project_picture = @project.project_pictures.new(params[:project_picture])
    @project_picture.save
    respond_with(:admins, @project, @project_picture, :location => admins_project_project_pictures_url(@project))
  end

  def destroy
    @project_picture = @project.project_pictures.find(params[:id])
    @project_picture.destroy
    respond_with(:admins, @project, @project_picture)
  end

protected

  def find_project
    @project = Project.find(params[:project_id])
  end
end
