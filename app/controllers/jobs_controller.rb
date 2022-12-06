class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.valid? && @job.save
      flash[:notice] = "Job created!"
      redirect_to dashboard_path
    else
      flash.now[:alert] = @job.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:start_on, :client_id, plumber_ids: [])
  end
end
