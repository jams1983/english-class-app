class GroupsController < ApplicationController

  before_action :authenticate_user!, scope: :teacher

  def index
    @groups = current_user_groups
  end

  def show
    @group = current_user_groups.find(params[:id])
  end

end
