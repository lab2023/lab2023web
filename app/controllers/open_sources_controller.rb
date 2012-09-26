class OpenSourcesController < ApplicationController
  layout false, :only => [:show]
  def index
    @open_sources = OpenSource.all
    respond_with(@open_sources)
  end

  def show
    @open_source = OpenSource.find(params[:id])
    respond_with(@open_source)
  end
end
