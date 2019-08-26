module Mutations
  class BaseDeletion < GraphQL::Schema::Mutation
    description 'Return `true` if successful or `false` otherwise'

    argument :id, ID, required: true

    type Boolean
  end
end
