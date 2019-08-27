# frozen_string_literal: true

require 'test_helper'

module Mutations
  class CreatePostTest < ActiveSupport::TestCase
    def perform(**args)
      CreatePost.new(object: nil, context: {}).resolve args
    end

    test 'create a new post' do
      payload = perform(
        body: 'MyString',
        user_id: users(:one).id
      )

      assert payload[:post].persisted?
      assert_equal payload[:post].body, 'MyString'
      assert_equal payload[:post].user.first_name, 'MyString'
    end
  end
end
