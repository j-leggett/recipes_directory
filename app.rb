require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

recipe_repository = RecipeRepository.new

# Print out each record from the result set .
p recipe_repository.find(2).id
p recipe_repository.find(2).name
p recipe_repository.find(2).avg_cooking_time + ' mins'
p recipe_repository.find(2).rating