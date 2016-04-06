module BinaryTree
        class Node
                attr_accessor :caracter, :left, :right, :peso, :bin, :caminho

                def initialize(caracter, left, right, peso, bin, caminho)
                        @caracter = caracter
                        @left = left
                        @right = right
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
                end # def inserse_no
    end#class

        def pre_order(node)
                if(node != nil)
                       #puts "chamou"
                        puts node.bin
                        if (node.caracter != nil)
                                puts "Folha : "
                                puts node.caracter
                               # puts "Caminho"
                                puts node.caminho
                        end #if

                        pre_order(node.left)
                        pre_order(node.right)
                end #if
        end #pre order

        $caminho = []
        def encontra_caminho_caracter(node)
                if(node != nil)
                        $caminho.push(node.bin) # adiciona no caminho
                        if (node.caracter != nil)
                                node.caminho = $caminho.join("") #guarda o caminho como string
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
                        if (node.caracter != nil)
                                $arvoreLinha.push(node.caracter)
                        end #if
                        arvore_parentizada(node.left)
                        arvore_parentizada(node.right)
                        $arvoreLinha.push(")")
                end #if
        end#arvore_arquivo

        $cabecalho = []
        def cria_cabecalho(node)
                if(node != nil)
                        if (node.caracter != nil)
                                $cabecalho.push(node.caminho << node.caracter)
                        end #if
                        cria_cabecalho(node.left)
                        cria_cabecalho(node.right)
                end #if
        end#cria_cabecalho

end #module
