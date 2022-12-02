module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :plumber_jobs, [Types::JobType], null: false, description: "jobs belonging to a plumber" do
      argument :plumber_id, Int
    end
    def plumber_jobs(plumber_id:)
      Plumber.find(plumber_id).jobs.includes(:client)
    end
  end
end
