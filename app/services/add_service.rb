class AddService
    def add(input_string)
        validate_input(input_string)
        delimiter = nil
        return 0 if input_string.empty?

        if input_string.match?(/\A\d+\z/)
            input_string.to_i
        end

        fetched_numbers = input_string.split(fetch_delimiter(input_string)).map(&:to_i)
        negative_fetched_numbers = fetched_numbers.select { |num| num < 0 }
        if negative_fetched_numbers.any?
            raise ArgumentError, "negative numbers not allowed #{negative_fetched_numbers.join(', ')}"
        end
        fetched_numbers.sum
    end

    def validate_input(input_string)
        raise ArgumentError, 'Input must be a string' unless input_string.is_a?(String)
    end

    def fetch_delimiter(input_string)
        default_delimiter = /[\n,]/
        
        if input_string.start_with?("//")
          custom_delimiter = input_string.split("\n").first[2..-1]
          Regexp.union(default_delimiter, /#{Regexp.escape(custom_delimiter)}/)
        else
          default_delimiter
        end
      end
end
