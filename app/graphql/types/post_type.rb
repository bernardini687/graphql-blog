module Types
  class PostType < BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :author, UserType, null: false, method: :user,
      description: 'The author of the post'
  end
end
