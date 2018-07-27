class Item
    attr_accessor :text, :checked
    def initialize(text="")
        @text = text
        @checked = false
    end

    def to_s
        if @checked
            return "[x] #{@text}"
        else
            return "[ ] #{@text}"
        end
    end
end