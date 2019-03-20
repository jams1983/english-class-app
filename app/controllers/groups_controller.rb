class GroupsController < ApplicationController

  before_action :authenticate_user!, scope: :teacher

  def index
    @groups = current_user_groups.order(:level)
  end

  def show
    @group ||= current_user_groups.find(params[:id])
  end

  def invoice
    @group ||= current_user_groups.find(params[:group_id])
    @date = parse_date_from_params(params[:date]) || Date.today
    @invoice = Invoice.new(@group, @date.beginning_of_month, @date.end_of_month)
  end

  private

  def parse_date_from_params(params_date)
    return nil if params_date.nil?
    string_date = "#{params_date[:year]}-#{params_date[:month]}-1"
    Date.parse(string_date)
  end

end
