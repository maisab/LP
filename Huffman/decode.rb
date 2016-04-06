load 'arvore.rb'

module Decodificador
        include BinaryTree

        $arvore_decode = nil
        def decodifica(cabecalho)
                linha = cabecalho.split("")
                cont = 0
                caminho_atual = []
                while(linha.length > cont) # para todo o cabeçalho
                        while((linha[cont] == '0') or (linha[cont] =='1' )) #encontra uma letra
                                caminho_atual.push(linha[cont])
                                cont = cont + 1
                        end#while

                        caminho_atual.push(linha[cont])
                        cont = cont + 1

                        insere_arvore_decode(caminho_atual) # insere na arvore

                        caminho_atual = [] #nova palavra
                end #while
        end #decodifica

        def insere_arvore_decode(caminho_atual)

                contador = 0

                if($arvore_decode == nil)
                        $arvore_decode = Node.new(nil, nil, nil, 0, 1, nil)
                        contador = contador + 1

                else
                        contador = contador + 1

                end # else

                node_atual = $arvore_decode

                while( caminho_atual.length  > contador)
                        if(caminho_atual[contador] == "0" and node_atual.left == nil)
                                node_atual.left = Node.new(nil, nil, nil, 0, 0, nil)
                                contador = contador + 1
                                node_atual = node_atual.left
                                #puts "Inseriu 0"

                        elsif (caminho_atual[contador] == "0" and node_atual.left != nil)
                                contador = contador + 1
                                node_atual = node_atual.left
                                #puts "Passou 0"

                        elsif (caminho_atual[contador] == "1" and node_atual.right == nil)
                                node_atual.right = Node.new(nil, nil, nil, 0, 1, nil)
                                contador = contador + 1
                                node_atual = node_atual.right
                                #puts "Inseriu 1"

                        elsif (caminho_atual[contador] == "1" and node_atual.right != nil)
                                contador = contador + 1
                                node_atual = node_atual.right
                                #puts "Passou 1"

                        elsif (node_atual.left == nil)
                                node_atual.caracter = caminho_atual[contador]
                                #node_atual.left = Node.new(caminho_atual[contador], nil, nil, 0, 0, nil)
                                contador = contador + 1

                        else
                                node_atual.caracter = caminho_atual[contador]
                                #node_atual.right = Node.new(caminho_atual[contador] ,nil, nil, 0, 1, nil)
                                contador = contador + 1

                        end # else
                end #while
        end #insere_arvore_decode


end#decodificador