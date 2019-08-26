module Mutations
  class UpdateUser < BaseMutation
    argument :id, ID, required: true
    argument :attributes, Types::UserAttributes, required: true

    field :user, Types::UserType, null: true

    def resolve id:, attributes:
      user = User.find_by_id(id)

      if user.update attributes.to_h
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
