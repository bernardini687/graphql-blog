module Mutations
  class DeleteUser < BaseDeletion
    type Boolean

    def resolve(id:)
      user = User.find_by_id id
      # If `nil` return `false`: couldn't destroy
      !user&.destroy.nil?
    end
  end
end
