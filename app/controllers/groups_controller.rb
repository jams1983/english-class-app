class GroupsController < ApplicationController

  before_action :authenticate_user!, scope: :teacher

  def index
    @groups = current_user_groups
  end

  def show
    @group ||= current_user_groups.find(params[:id])
  end

  def invoice
    @group ||= current_user_groups.find(params[:group_id])
    @start_date = parse_date_from_params(params[:start_date]) || Date.today.at_beginning_of_month
    @end_date = parse_date_from_params(params[:end_date]) || Date.today
    @invoice = GroupInvoice.new(@group, @start_date, @end_date)
  end

  private

  def parse_date_from_params(params_date)
    return nil if params_date.nil?
    string_date = params_date.to_hash.values.join("-")
    Date.parse(string_date)
  end

end
