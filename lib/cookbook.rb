require 'csv'
require_relative 'recipe'

class Cookbook
    def initialize(csv_file_path)
        @csv_file_path = csv_file_path
        @recipes       = []

        load_csv()
    end

    def all
        @recipes
    end

    def create(recipe)
        @recipes << recipe

        save_csv()
    end

    def destroy(recipe_index)
        @recipes.delete_at(recipe_index)

        save_csv()
    end

    private

    def save_csv
        CSV.open(@csv_file_path, "wb") do |csv|
            csv << [ "name", "description" ]
            @recipes.each do |recipe|
                csv << [ recipe.name, recipe.description ]
            end
        end
    end

    def load_csv
        CSV.foreach(@csv_file_path, headers: :first_row) do |row|
            # p row { "name":"Christmas crumble" "description":"Crumble description" }
            name = row["name"]
            desc = row["description"]

            @recipes << Recipe.new(name, desc)
        end
    end
end