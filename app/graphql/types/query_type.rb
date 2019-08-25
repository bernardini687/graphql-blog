module Types
  class QueryType < Types::BaseObject

    field :user, UserType, null: true do
      argument :id, ID, required: true
    end

    field :post, PostType, null: true do
      argument :id, ID, required: true
    end

    field :comment, CommentType, null: true do
      argument :id, ID, required: true
    end

    def user id:
      User.find_by_id(id)
    end

    def post id:
      Post.find_by_id(id)
    end

    def comment id:
      Comment.find_by_id(id)
    end
  end
end
