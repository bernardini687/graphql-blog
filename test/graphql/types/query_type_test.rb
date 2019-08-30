# frozen_string_literal: true

require 'test_helper'

module Types
  class QueryTypeTest < ActiveSupport::TestCase
    def perform(query:, **args)
      QueryType.new(object: nil, context: {}).send(query, args)
    end

    test 'read all the posts' do
      payload = perform(query: :all_users)

      assert_not_nil payload
    end
  end
end
