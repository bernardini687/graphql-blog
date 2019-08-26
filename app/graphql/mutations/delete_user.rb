module Mutations
  class DeleteUser < GraphQL::Schema::Mutation
    description 'Return `true` if successful or `false` otherwise'

    argument :id, ID, required: true

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
