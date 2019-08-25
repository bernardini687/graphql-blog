module Types
  class MutationType < Types::BaseObject
    field :create_post, PostType, null: true do
      argument :body, String, required: true
    end

    def create_post(body:)
      Post.create! body: body, user: User.all.sample
    end

    field :create_post, mutation: Mutations::CreatePost
    field :create_comment, mutation: Mutations::CreateComment
  end
end
