module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :user, UserType, null: false do # Or true?
      description 'Find a user by ID'
      argument :id, ID, required: true
    end

    def user id:
      User.find_by_id(id) # Or .find
    end
  end
end
