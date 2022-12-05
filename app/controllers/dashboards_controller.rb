class DashboardsController < ApplicationController
  def show
    @start_on_from = params.dig(:by_period, :start_on_from)
    @start_on_to = params.dig(:by_period, :start_on_to)
    @current_admin = current_admin
    @jobs = Job.all.includes(:client, :plumbers).order(start_on: :desc)
    if @start_on_from.present? && @start_on_to.present?
      @jobs = @jobs.by_period(@start_on_from, @start_on_to)
    end
  end
end
