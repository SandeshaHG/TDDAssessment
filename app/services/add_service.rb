class AddService
    def add(input_string)
        validate_input(input_string)
        delimiter = nil
        return 0 if input_string.empty?

        if input_string.match?(/\A\d+\z/)
            input_string.to_i
        end

        input_string.split(fetch_delimiter(input_string)).map(&:to_i).sum
    end

    def validate_input(input_string)
        raise ArgumentError, 'Input must be a string' unless input_string.is_a?(String)
    end

    def fetch_delimiter(input_string)
        unless input_string.start_with?("//")
            return /[\n,]/
        end
        custom_delimter = input_string.split("\n").first
        custom_delimter = custom_delimter[2..-1]
    end
end
