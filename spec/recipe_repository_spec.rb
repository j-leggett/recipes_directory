require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it 'prints all recipes' do

    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq 3

    expect(recipes[0].id).to eq '1'
    expect(recipes[0].name).to eq 'Carbonara'
    expect(recipes[0].avg_cooking_time).to eq '15'
    expect(recipes[0].rating).to eq '5'

    expect(recipes[1].id).to eq '2'
    expect(recipes[1].name).to eq 'Roast Chicken'
    expect(recipes[1].avg_cooking_time).to eq '120'
    expect(recipes[1].rating).to eq '4'

    expect(recipes[2].id).to eq '3'
    expect(recipes[2].name).to eq 'salad'
    expect(recipes[2].avg_cooking_time).to eq '7'
    expect(recipes[2].rating).to eq '1'
  end

  it 'finds the correct recipe with id = 1' do
    repo = RecipeRepository.new

    recipes = repo.find(1)
    expect(recipes.id).to eq '1'
    expect(recipes.name).to eq 'Carbonara'
    expect(recipes.avg_cooking_time).to eq '15'
    expect(recipes.rating).to eq '5'
  end


  
end