require_relative './recipe'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    sql = 'SELECT id, name, avg_cooking_time, rating FROM recipes;'

    result_set = DatabaseConnection.exec_params(sql, [])

    recipes = []

    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.avg_cooking_time = record['avg_cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end

    return recipes

    # Returns an array of Student objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;
    sql = 'SELECT id, name, avg_cooking_time, rating FROM recipes WHERE id = $1;'
    param = [id]

    result_set = DatabaseConnection.exec_params(sql, param)

    record = result_set[0]

    recipe = Recipe.new
    recipe.id = record['id']
    recipe.name = record['name']
    recipe.avg_cooking_time = record['avg_cooking_time']
    recipe.rating = record['rating']

    return recipe
  end
end