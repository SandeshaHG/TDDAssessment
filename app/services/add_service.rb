class AddService
    def add(input_string)
        unless input_string.is_a?(String)
            raise ArgumentError, 'Input must be a string'
        end
    end
end
