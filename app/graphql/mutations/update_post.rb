module Mutations
  class UpdatePost < BaseMutation
    argument :id, ID, required: true
    argument :body, String, required: true

    field :post, Types::PostType, null: true

    def resolve(id:, body:)
      post = Post.find_by_id id
      return { post: nil, errors: ['Post not found'] } if post.nil?

      if post.update body: body
        { post: post, errors: [] }
      else
        { post: nil, errors: post.errors.full_messages }
      end
    end
  end
end
