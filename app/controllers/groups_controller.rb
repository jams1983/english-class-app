class GroupsController < ApplicationController

  def index
    @subject = current_user.subjects.find(params[:subject_id])
    @groups = @subject.groups
  end
end
