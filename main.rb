require "./list.rb"
class ListApp
    attr_writer :list
    def initialize
        @list = List.new
    end

    def run
        puts "Bienvenido a tu lista de compras"
        loop do
            puts "a - Agregar un articulo"
            puts "r - Remover un articulo"
            puts "v - Mostrar todos los articulos"
            puts "m - Marcar un articulo"
            puts "b - Borrar todos los articulos"
            puts "s - Salir de la aplicacion"
            res = gets.chomp
            case res
            when "a", "A"
                opt = ""
                until opt == "n" || opt == "N"
                    puts "Ingrese el nombre del articulo"
                    print "> "
                    item = gets.chomp
                    @list.add_item(item)
                    puts "Desea agregar otro articulo? [S/n]"
                    print "> "
                    opt = gets.chomp
                end
            when "r", "R"
                if @list.length == 0
                    @list.show_all
                else
                    opt = ""
                    until opt == "n" || opt == "N"
                        @list.show_all
                        puts "Ingrese el número del articulo a eliminar"
                        print "> "
                        index = gets.to_i
                        if @list.anyat(index) == nil
                            puts "Fuera de rango"
                            redo
                        else
                            @list.remove_item(index)
                        end
                        if @list.length == 0
                            puts "La lista está vacía"
                            break
                        else
                            puts "Desea eliminar otro articulo? [S/n]"
                            print "> "
                            opt = gets.chomp
                        end
                    end
                end
            when "v", "V"
                @list.show_all
            when "m", "M"
                if @list.length == 0
                    @list.show_all
                    next
                else
                    opt = ""
                    until opt == "n" || opt == "N"
                        @list.show_all
                        puts "Ingrese el número del articulo que quiere marcar"
                        print "> "
                        index = gets.to_i
                        if @list.anyat(index) == nil
                            puts "Fuera de rango"
                            redo
                        else
                            puts @list.check_item(index)
                        end
                        puts "Desea marcar otro articulo? [S/n]"
                        print "> "
                        opt = gets.chomp
                    end
                end
            when "b", "B"
                if @list.length == 0
                    @list.show_all
                else
                    puts "Está seguro que quiere borrar toda la lista? [S/n]"
                    print "> "
                    opt = gets.chomp
                    if opt == "S" || opt == "s"
                        @list.remove_all
                        @list.show_all
                        next
                    else
                        next
                    end
                end
            when "s", "S"
                puts "Gracias por utilizar la aplicacion!"
                break
            else
                puts "Opcion invalida"
            end
        end
    end
end

list_app = ListApp.new
list_app.run