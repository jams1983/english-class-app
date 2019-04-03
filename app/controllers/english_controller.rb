class EnglishController < ApplicationController
  before_action :authenticate_user!

  def redirect_to_student_root_path
    redirect_to root_path
  end

  protected

  def parse_date_from_params(params_date)
    return nil if params_date.nil?

    string_date = if params_date.is_a?(String)
      params_date
    else
      "#{params_date[:year]}-#{params_date[:month]}-1"
    end
    Date.parse(string_date)
  end
end