class TeamsController < ApplicationController
  def index
    @teams = Team.all
    respond_with(@teams)
  end
end
