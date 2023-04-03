module Types
  class UserType < Types::BaseObject
    description 'ユーザー'

    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :slack_user_id, String, null: false
  end
end
