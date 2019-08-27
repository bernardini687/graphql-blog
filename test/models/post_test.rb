# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    user = users :one
    *comments = comments(:one), comments(:two)
    @post = Post.new body: 'MyString', user: user, comments: comments
  end

  test 'valid post' do
    assert @post.valid?
  end

  test 'invalid without user' do
    @post.user = nil

    refute @post.valid?
    assert_not_empty @post.errors[:user]
  end

  test 'invalid without body' do
    @post.body = ''

    refute @post.valid?
    assert_not_empty @post.errors[:body]
  end

  test 'destroys itself and all of its comments' do
    @post.save
    @post.destroy

    assert_nil Post.find_by_id @post.id
    assert_equal Comment.all.size, 0
  end
end
