module Mutations
  class UpdateUser < BaseMutation
    argument :attributes, Types::UserAttributes, required: true

    field :user, Types::UserType, null: true

    def resolve(attributes:)
      user = User.find_by_id(attributes[:id])
      return { user: nil, errors: ['User not found'] } if user.nil?

      if user.update attributes.to_h
        user.success_payload
      else
        user.failure_payload
      end
    end
  end
end
