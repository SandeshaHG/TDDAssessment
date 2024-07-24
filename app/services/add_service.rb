class AddService
    def add(input_string)
        validate_input(input_string)
        return 0 if input_string.empty?

        if input_string.match?(/\A\d+\z/)
            input_string.to_i
        end
         input_string.split(/[\n,]/).map(&:to_i).sum
    end

    def validate_input(input_string)
        raise ArgumentError, 'Input must be a string' unless input_string.is_a?(String)
    end
end
