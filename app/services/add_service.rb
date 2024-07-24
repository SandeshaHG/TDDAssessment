class AddService
    def add(input_string)
        unless input_string.is_a?(String)
            raise ArgumentError, 'Input must be a string'
        end
        return 0 if input_string.empty?

        if input_string.match?(/\A\d+\z/)
            return input_string.to_i
        end

        if input_string.match?(/[a-zA-Z]/)
            raise ArgumentError, 'String contains alphabets'
        end
    end
end
