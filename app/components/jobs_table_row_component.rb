class JobsTableRowComponent < ViewComponent::Base
  with_collection_parameter :job

  def initialize(job:)
    @job = job
  end

  private

  attr_reader :job

  def start_date = job.start_on.strftime("%e/%_m/%Y")

  def client_name = job.client.name

  def done?
    "done" if job.done_at.present?
  end

  def assigned_plumbers
    job.plumbers.map(&:name).join(", ")
  end
end
