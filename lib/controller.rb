require_relative 'view'
require_relative 'recipe'

class Controller
    def initialize(cookbook)
        @cookbook = cookbook
        @view     = View.new
    end

    def add
        name = @view.ask_for("name")
        desc = @view.ask_for("description")

        recipe = Recipe.new(name, desc)

        @cookbook.create(recipe)
    end

    def list
        display()
    end

    def remove
        display()
        index = @view.ask_index
        @cookbook.destroy(index) unless index.nil?
    end

    private

    def display
        recipes = @cookbook.all
        @view.display_list(recipes)
    end
end