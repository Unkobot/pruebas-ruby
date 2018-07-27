require "./item.rb"
class List
    attr_writer :items

    def initialize
        @items = Array.new()
    end
    
    def add_item(value)
        item = Item.new(value)
        @items.push(item)
        puts "*"*40
        puts "#{item.text} Se ha agregado a tu lista!"
        puts "*"*40
    end

    def remove_item(index)
        item = @items.delete_at(index)
        puts "*"*40
        puts "#{item.text} se ha removido de tu lista!"
        puts "*"*40
    end

    def check_item(index)
        @items[index].checked = true
        return "#{@items[index].text} se ha marcado!"
    end

    def remove_all
        @items.clear
    end

    def show_all
        if @items.length == 0
            puts "No hay ningun articulo en tu lista"
        else
            @items.each_with_index do |item, index|
                puts "#{index} - #{item.to_s}"
            end
        end
    end

    def length
        return @items.length
    end

    def anyat(index)
        return @items.at(index)
    end
end