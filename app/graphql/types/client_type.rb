module Types
  class ClientType < ::Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :age, Int, null: false
  end
end
