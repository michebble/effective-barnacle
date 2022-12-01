class DashboardsController < ApplicationController
  def show
    @current_admin = current_admin
  end
end
