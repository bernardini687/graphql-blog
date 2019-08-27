# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    user = users :one
    post = posts :one
    @comment = Comment.new body: 'MyString', user: user, post: post
  end

  test 'valid comment' do
    assert @comment.valid?
  end

  test 'invalid without user' do
    @comment.user = nil

    refute @comment.valid?
    assert_not_empty @comment.errors[:user]
  end

  test 'invalid without post' do
    @comment.post = nil

    refute @comment.valid?
    assert_not_empty @comment.errors[:post]
  end

  test 'invalid without body' do
    @comment.body = ''

    refute @comment.valid?
    assert_not_empty @comment.errors[:body]
  end
end
