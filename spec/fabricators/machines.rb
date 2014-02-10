require 'faker'

Fabricator(:machine) do
  name { Faker::Code.isbn }
  location { Faker::Code.isbn }
  application_ids { [ Faker::Code.isbn] }
end