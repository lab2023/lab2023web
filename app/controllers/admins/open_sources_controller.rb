class Admins::OpenSourcesController < Admins::ApplicationController
  def index
    @open_sources = OpenSource.paginate(:page => params[:page])
    respond_with(:admins, @open_sources)
  end

  def show
    @open_source = OpenSource.find(params[:id])
    respond_with(:admins, @open_source)
  end

  def new
    @open_source = OpenSource.new
    respond_with(:admins, @open_source)
  end

  def edit
    @open_source = OpenSource.find(params[:id])
  end

  def create
    @open_source = OpenSource.new(params[:open_source])
    @open_source.save
    respond_with(:admins, @open_source)
  end

  def update
    @open_source = OpenSource.find(params[:id])
    @open_source.update_attributes(params[:open_source])
    respond_with(:admins, @open_source)
  end

  def destroy
    @open_source = OpenSource.find(params[:id])
    @open_source.destroy
    respond_with(:admins, @open_source)
  end
end
