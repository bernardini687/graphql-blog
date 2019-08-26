module Mutations
  class CreateUser < BaseMutation
    argument :attributes, Types::UserAttributes, required: true

    field :user, Types::UserType, null: true

    def resolve(attributes:)
      user = User.new attributes.to_h

      user.save ? user.success_payload : user.failure_payload
    end
  end
end
