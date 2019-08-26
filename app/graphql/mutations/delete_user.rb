module Mutations
  class DeleteUser < BaseDeletion
    type Boolean

    def resolve(id:)
      user = User.find_by_id id

      if user
        user.destroy
        true
      else
        false
      end
    end
  end
end
