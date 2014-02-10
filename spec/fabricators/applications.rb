require 'faker'

Fabricator(:application) do
  on_init { init_with( name: Faker::Code.isbn  ) }
  type { Faker::Code.isbn }
end