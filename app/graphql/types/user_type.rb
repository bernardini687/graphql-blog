module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
  end
end
