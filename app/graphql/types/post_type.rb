# frozen_string_literal: true

module Types
  class PostType < BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :comments, [CommentType], null: true
    field :author, UserType, null: false, method: :user,
      description: 'The author of the post'
  end
end
