module Types
  class MutationType < Types::BaseObject
    field :mark_job_done, mutation: Mutations::MarkJobDoneMutation
  end
end
