class Array
    def to_list
        list = ""
        self.each_with_index do |item, n|  
           list = "#{list}\n#{ yield(n+1, item) }"
        end
        puts list
    end
end


["моркjd", "чес", "ябл"].to_list{ |n, value| "line #{n}. #{value}" }


