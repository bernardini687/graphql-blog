# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @user = users :one
    @post = posts :one
  end

  test "body can't be blank" do
    comment = Comment.new user: @user, post: @post

    refute comment.valid?
  end
end
