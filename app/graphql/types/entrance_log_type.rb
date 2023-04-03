module Types
  class EntranceLogType < Types::BaseObject
    description '入退室記録'

    field :id, ID, null: false
    field :user, UserType, null: false
    field :entered_at, GraphQL::Types::ISO8601DateTime, null: true, description: '入室日時'
    field :exited_at, GraphQL::Types::ISO8601DateTime, null: true, description: '退室日時'
  end
end
