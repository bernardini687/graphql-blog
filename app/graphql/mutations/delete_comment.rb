module Mutations
  class DeleteComment < BaseDeletion
    type Boolean

    def resolve(id:)
      comment = Comment.find_by_id id
      # If `nil` return `false`: couldn't destroy
      !comment&.destroy.nil?
    end
  end
end
