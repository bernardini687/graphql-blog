module Mutations
  class DeletePost < BaseDeletion
    type Boolean

    def resolve(id:)
      post = Post.find_by_id id
      # If `nil` return `false`: couldn't destroy
      !post&.destroy.nil?
    end
  end
end
