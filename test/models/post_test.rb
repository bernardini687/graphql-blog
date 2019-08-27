# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    user = users :one
    @post = Post.new body: 'MyString', user: user
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
end
