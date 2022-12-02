module Mutations
  class MarkJobDoneMutation < Mutations::BaseMutation
    argument :job_id, ID, required: true

    field :job, Types::JobType
    field :errors, [String], null: false

    def resolve(job_id:)
      job = Job.find(job_id)
      job.mark_as_done
      if job.errors.none?
        {
          job: job,
          errors: []
        }
      else
        {
          job: nil,
          errors: job.errors.full_messages
        }
      end
    end
  end
end
