module Types
  class UserAttributes < BaseInputObject
    description 'Attributes for creating or updating a user'

    argument :first_name, String, required: true
    argument :last_name, String, required: false
    argument :street, String, required: true
    argument :number, String, required: true
    argument :city, String, required: true
    argument :postcode, String, required: true
    argument :country, String, required: true
  end
end
