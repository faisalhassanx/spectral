require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: "Chicken Parm", summary: "Best chicken parm recipe",
                        description: "heat oil, add onions, add tomato sauce, 
                                      add chicken, cook for 20 minutes")  
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
end