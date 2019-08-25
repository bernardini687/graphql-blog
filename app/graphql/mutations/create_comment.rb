module Mutations
  class CreateComment < BaseMutation
    argument :body, String, required: true
    argument :post_id, ID, required: true
    argument :user_id, ID, required: true

    field :comment, Types::CommentType, null: true
    field :errors, [String], null: false

    def resolve body:, post_id:, user_id:
      post = Post.find_by_id post_id
      comment = post.comments.build body: body, user_id: user_id
      if comment.save
        {
          comment: comment,
          errors: []
        }
      else
        {
          comment: nil,
          errors: comment.errors.full_messages
        }
      end
    end
  end
end
