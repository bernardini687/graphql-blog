module Mutations
  class CreateComment < BaseMutation
    argument :body, String, required: true
    argument :post_id, ID, required: true
    argument :user_id, ID, required: true # Will be current_user

    field :comment, Types::CommentType, null: true
    # :errors is in the BaseMutation

    def resolve body:, post_id:, user_id:
      comment = Comment.new body: body, post_id: post_id, user_id: user_id

      if comment.save
        { comment: comment, errors: [] }
      else
        { comment: nil, errors: comment.errors.full_messages }
      end
    end
  end
end
