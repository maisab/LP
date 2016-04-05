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
                if(node != nil)
                        puts node.peso
                        if (node.caracter != nil)
                                puts "Folha : "
                                puts node.caracter
                                puts "Caminho"
                                puts node.caminho

                        end #if
                        pre_order(node.left)
                        pre_order(node.right)
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

        $caminho = []
        def encontra_caminho_caracter(node)
                if(node != nil)
                        $caminho.push(node.bin) # adiciona no caminho
                        #puts "Adicionando no array"
                        #puts $caminho.length
                        if (node.caracter != nil)
                                node.caminho = $caminho.join("") #guarda o caminho como string
                          #      puts "Caminho caracter"
                            #    puts node.caracter
                             #   puts node.caminho
                        end #if

                        encontra_caminho_caracter(node.left)
                        encontra_caminho_caracter(node.right)
                        $caminho.pop #remove a ultima posição
                end #if
        end#encontra_caminho_caracter

        $arvoreLinha = []
        def arvore_parentizada(node)
                if(node != nil)
                        $arvoreLinha.push("(")
                        $arvoreLinha.push(node.peso)
                        #puts "("
                        if (node.caracter != nil)
                                $arvoreLinha.push(node.caracter)
                                #puts node.caracter
                        end #if
                        arvore_parentizada(node.left)
                        arvore_parentizada(node.right)
                        $arvoreLinha.push(")")
                        #puts ")"

                end #if
        end#arvore_arquivo


end #module
