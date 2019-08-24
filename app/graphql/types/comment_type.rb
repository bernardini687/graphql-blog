module Types
  class CommentType < BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :post_commented, PostType, null: false, method: :post
    field :author, UserType, null: false, method: :user,
      description: 'The author of the comment'
  end
end
