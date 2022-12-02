class JobsTableComponent < ViewComponent::Base
  def initialize(jobs:)
    @jobs = jobs
  end

  private

  attr_reader :jobs
end
