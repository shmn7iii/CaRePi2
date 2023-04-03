module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :user, UserType, null: true do
      argument :username, String, required: true
    end

    def user(username:)
      User.find_by(username:)
    end
  end
end
