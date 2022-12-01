class DashboardsController < ApplicationController
  def show
    @current_admin = current_admin
    @jobs = Job.all.includes(:client, :plumbers).order(start_on: :desc)
  end
end
