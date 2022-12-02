module Types
  class JobType < ::Types::BaseObject
    field :id, ID, null: false
    field :client, Types::ClientType, null: false
    field :start_on, GraphQL::Types::ISO8601Date, null: false
    field :done_at, GraphQL::Types::ISO8601DateTime
  end
end
