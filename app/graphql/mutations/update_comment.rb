module Mutations
  class UpdateComment < BaseMutation
    argument :id, ID, required: true
    argument :body, String, required: true

    field :comment, Types::CommentType, null: true

    def resolve(id:, body:)
      comment = Comment.find_by_id id
      return { comment: nil, errors: 'Comment not found' } if comment.nil?

      if comment.update body: body
        { comment: comment, errors: [] }
      else
        { comment: nil, errors: comment.errors.full_messages }
      end
    end
  end
end
