module Mutations
  class CreatePost < BaseMutation
    argument :body, String, required: true
    argument :user_id, ID, required: true # Will be current_user

    field :post, Types::PostType, null: true

    def resolve(body:, user_id:)
      # user: context[:current_user]
      post = Post.new body: body, user_id: user_id

      if post.save
        { post: post, errors: [] }
      else
        { post: nil, errors: post.errors.full_messages }
      end
    end
  end
end
