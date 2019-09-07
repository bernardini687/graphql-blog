# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :user, UserType, null: true do
      argument :id, ID, required: true
    end

    field :post, PostType, null: true do
      argument :id, ID, required: true
    end

    field :comment, CommentType, null: true do
      argument :id, ID, required: true
    end

    field :all_users, [UserType], null: false
    field :all_posts, [PostType], null: false

    def user(id:)
      User.find_by_id id
    end

    def post(id:)
      Post.find_by_id id
    end

    def comment(id:)
      Comment.find_by_id id
    end

    def all_users
      User.all
    end

    def all_posts
      Post.all
    end
  end
end
