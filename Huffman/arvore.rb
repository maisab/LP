module BinaryTree
        class Node
                attr_accessor :caracter, :left, :right, :frequencia, :peso, :bin, :caminho#get and set

                def initialize(caracter, left, right, frequencia, peso, bin, caminho)
                        @caracter = caracter
                        @left = left
                        @right = right
                        @frequencia = frequencia
                        @peso = peso
                        @bin = bin
                        @caminho = caminho

                end #def
        end #class


        class BinarySearchTree

                #inicializar a raiz
                def inicializa(c)
                        @raiz = Node.new.initialize(c, nil, nil, 1,1, nil, nil) #frequencia = 1
                end #def inicializa

                def insere_No(node)
                        puts "Inserindo frequencia: " + node.frequencia
                        #puts "Inserindo caracter: " + node.caracter
                end # def inserse_no
    end#class

        def pre_order(node)
                puts "--------- Chamou --------"
                if(node != nil)
                        puts node.peso
                        if (node.caracter != nil)
                                puts "Folha : "
                                puts node.caracter

                        end #if
                        puts "bin : "
                        puts node.bin
                        pre_order(node.left)
                        pre_order(node.right)
                        puts "-------------"
                end #if
        end #pre order

        def pos_order(node)
                puts "--------- Chamou --------"
                if(node != nil)

                        pos_order(node.left)
                        pos_order(node.right)
                        puts node.peso
                        if (node.caracter != nil)
                                puts "Folha : "
                                puts node.caracter
                        end #if
                        puts "-----------"
                end #if
        end #pos order

        def in_order(node)

                if(node != nil)
                        in_order(node.left)
                        puts node.peso
                        if (node.caracter != nil)
                                puts "Folha : "
                                puts node.caracter
                        end #if
                        in_order(node.right)
                end #if
        end #in order

end #module
