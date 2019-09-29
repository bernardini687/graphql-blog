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

    field :login, String, null: true, description: 'user login' do
      argument :username, String, required: true
      argument :password, String, required: true
    end

    field :logout, Boolean, null: true
    field :current_user, UserType, null: true
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

    def login(username:, password:)
      user = User.find_by_first_name(username)
      user.sessions.create.key if user&.authenticate(password)
    end

    def logout
      session = Session.find_by_id(context[:session_id])
      true if session&.destroy
    end

    def current_user
      context[:current_user]
    end

    def all_users
      User.all
    end

    def all_posts
      Post.all
    end
  end
end
