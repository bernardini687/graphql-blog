module Types
  class QueryType < Types::BaseObject
    # Root-level fields will be entry points for queries on your schema

    field :user, UserType, null: true do
      # description 'This is how to add a description'
      argument :id, ID, required: true
    end

    field :post, PostType, null: true do
      argument :id, ID, required: true
    end

    # field :comment, CommentType, null: true do
    #   argument :id, ID, required: true
    # end

    def user id:
      User.find_by_id(id)
    end

    def post id:
      Post.find_by_id(id)
    end

    # def comment id:
    #   Comment.find_by_id(id)
    # end
  end
end
