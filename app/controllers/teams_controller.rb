class TeamsController < ApplicationController
  def index
    @teams = Team.all
    respond_with(@teams)
  end

  def show
    @team = Team.find(params[:id])
    respond_with(@team)
  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(params[:team])
    @team.save
    respond_with(@team)
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(params[:team])
    respond_with(@team)
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    respond_with(@team)
  end
end
