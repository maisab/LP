load 'arvore.rb'

module Decodificador
        include BinaryTree

        def  arvore_decode(linha)
                cabecalho = linha.split("")
                puts cabecalho.length

                roots = Node.new(nil, nil, nil, 0, 1, nil)
                node = roots
                cont = 1
                puts roots.bin
                puts "----------------salvou raiz-------"

                while( cabecalho. length > cont)
                        if(node != nil)
                               if( (cabecalho[cont] == '0') and (node.left == nil) )
                                        puts "Inserindo esquerda"
                                        puts cabecalho[cont]
                                        puts "contador"
                                        puts cont
                                        puts "-----------------------------------------------------------"

                                        node.left = Node.new(nil, nil, nil, 0, 0, nil)
                                        node = node.left
                                        cont = cont + 1

                                elsif ( (cabecalho[cont] == '0') and (node.left != nil ))
                                        puts "Passou pela esquerda"
                                        puts cabecalho[cont]
                                        puts "contador"
                                        puts cont
                                        puts "---------------------"
                                        node = node.left
                                        cont = cont + 1

                                elsif ((cabecalho[cont] == '1') and (node.right == nil))
                                        puts "Inserindo direita"
                                        puts cabecalho[cont]
                                        puts "contador"
                                        puts cont
                                        puts "---------------------"

                                        node.right = Node.new(nil, nil, nil, 0, 1, nil)
                                        node = node.right
                                        cont = cont + 1

                                elsif ( (cabecalho[cont] == '1') and (node.right != nil))
                                        puts "Passou direita"
                                        puts cabecalho[cont]
                                        puts "contador"
                                        puts cont
                                        puts "---------------------"
                                        node = node.right
                                        cont = cont + 1

                               elsif (node.left == nil)
                                        puts "No folha a esquerda"
                                        puts cabecalho[cont]
                                        node.left = Node.new(cabecalho[cont], nil, nil, 0, 0, nil)
                                        node = roots
                                        puts "contador"
                                        puts cont
                                        cont = cont + 2
                                        puts "----------------------------------------------"

                               else
                                        puts "No folha a direita"
                                        puts cabecalho[cont]
                                        node.right = Node.new(cabecalho[cont], nil, nil, 0, 1, nil)
                                        puts "contador"
                                        puts cont
                                        node = roots
                                        cont = cont + 2
                                        puts"----------"

                                end #else
                          end #if
                end#while

                pre_order(roots)

                $arvore = roots
        end # arvore_decode

        def decodifica_frase(frase)
                linha = frase.split("")

        end#decodifica_frase


end#decodificador