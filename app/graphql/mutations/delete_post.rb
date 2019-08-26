module Mutations
  class DeletePost < BaseDeletion
    type Boolean

    def resolve(id:)
      post = Post.find_by_id id

      if post
        post.destroy
        true
      else
        false
      end
    end
  end
end
