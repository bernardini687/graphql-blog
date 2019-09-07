# frozen_string_literal: true

require 'test_helper'

module Types
  class QueryTypeTest < ActiveSupport::TestCase
    def all_users_query
      <<~Q
        query {
          allUsers {
            firstName
          }
        }
      Q
    end

    def all_posts_query
      <<~Q
        query {
          allPosts {
            body
          }
        }
      Q
    end

    def perform(query:)
      GraphqlBlogSchema.execute(query).as_json
    end

    test 'read all the users' do
      FactoryBot.create_pair :user

      payload = perform(query: all_users_query)
      all_users = payload.dig('data', 'allUsers')

      assert_includes all_users, 'firstName' => 'John1'
      assert_equal 4, all_users.size
    end

    test 'read all the posts' do
      FactoryBot.create_pair :post

      payload = perform(query: all_posts_query)
      all_posts = payload.dig('data', 'allPosts')

      assert_includes all_posts, 'body' => 'Mikamai1'
      assert_equal 4, all_posts.size
    end
  end
end
