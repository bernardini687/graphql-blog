module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: true
    field :street, String, null: false
    field :number, String, null: false
    field :city, String, null: false
    field :postcode, String, null: false
    field :country, String, null: false
    field :posts, [PostType], null: true
    field :comments, [CommentType], null: true
    field :full_address, String, null: false

    def full_address
      "#{object.number} #{object.street}, "\
      "#{object.city} #{object.postcode}, #{object.country}"
    end
  end
end
