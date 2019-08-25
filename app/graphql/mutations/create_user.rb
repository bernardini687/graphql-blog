module Mutations
  class CreateUser < BaseMutation
    argument :attributes, Types::UserAttributes, required: true

    field :user, Types::UserType, null: true

    def resolve attributes:
      user = User.new attributes.to_h

      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
