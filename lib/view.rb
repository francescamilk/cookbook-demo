class View
    def display_list(recipes)
        recipes.each_with_index do |recipe, i|
            puts "#{i + 1} - #{recipe.name.capitalize}: #{recipe.description}"
        end
    end

    def ask_index
        puts "Which one (type index) ?"
        index = gets.chomp.to_i - 1

        puts "Are you sure? [y|n]"
        answer = gets.chomp.downcase

        return index if answer.start_with?("y")
        ask_index() unless answer.start_with?("n")
    end

    # def ask_name
    #     puts "What's the name?"
    #     gets.chomp
    # end

    # def ask_desc
    #     puts "What's the description?"
    #     gets.chomp
    # end

    def ask_for(thing)
        puts "What's the #{thing}?"
        gets.chomp
    end
end
