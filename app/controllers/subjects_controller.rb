class SubjectsController < ApplicationController

  before_action :authenticate_user!, scope: :teacher

  def index
    @subjects = current_user.subjects
  end

end
