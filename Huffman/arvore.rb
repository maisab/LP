module BinaryTree
    class Node
        attr_accessor :caracter, :left, :right, :frequencia, :peso #get and set

        def initialize(caracter, left, right, frequencia, peso)
            @caracter = caracter
            @left = left
            @right = right
            @frequencia = frequencia
            @peso = peso
        end #def
    end #class


    class BinarySearchTree

        #inicializar a raiz
        def inicializa(c)
            @raiz = Node.new(c, nil, nil, 1) #frequencia = 1
        end #def inicializa

        def insere_No(node)
                puts "Inserindo frequencia: " + node.frequencia
                puts "Inserindo caracter: " + node.caracter

                no_atual = @raiz

                while nil != no_atual

                      if (node.peso < no_atual.peso) && (no_atual.left == nil) #novo nó a esquerda
                                no_atual.left = Node.new(letra, nil, nil, 1,)

                        elsif  (letra > no_atual.caracter) && (no_atual.right == nil)
                                no_atual.right = Node.new(letra, nil, nil, 1) #novo nó a direita

                        elsif (letra < no_atual.caracter) #desce para esquerda
                                no_atual = no_atual.left

                        elsif (letra > no_atual.caracter) #desce para direita
                                no_atual = no_atual.right
                        else
                                no_atual.frequencia += 1  #incrementa a frequencia
                        end #else
                end #while
        end # def insert
    end#class

end #module
