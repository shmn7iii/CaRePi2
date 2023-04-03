module Mutations
  class UpdateUserEntranceState < BaseMutation
    argument :username, String, required: true

    field :entrance_log, Types::EntranceLogType, null: false

    def resolve(username:)
      user = User.find_or_create_by(username:)
      entrance_log = if user.enterd?
                       UserExitsService.execute!(user:)
                     else
                       UserEntersService.execute!(user:)
                     end

      { entrance_log: }
    end
  end
end
