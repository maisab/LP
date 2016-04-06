load "arvore.rb" #importa o arquivo
load "decode.rb"

module Lista_Modulo
       include BinaryTree
       $lista_nos = []

        def ler_arquivo_codifica(nome)
                File.open(nome, 'r') do | f1|
                        while line = f1.gets
                                quebra_linha(line)
                        end #end while
                end #end File
        end #def ler_arquivo

        def quebra_linha(linha)
                array_linha = linha.split("")
                insere_node_lista(array_linha)
        end # def quebra_linha

        def insere_node_lista(array_linha)
                array_linha.each do | i |
                        node = Node.new(i, nil, nil, 1, nil, nil)
                        verifica_lista(node)
                end # end for each

                ordena_lista #chama a função de ordenção

        end # def insere

        def verifica_lista(node)
            if($lista_nos.length == 0) #inicializa a lista
                    $lista_nos[0] = node
            else
                    estaNaLista = 0
                    index = 0

                    $lista_nos.each do | item|
                        if(item.caracter == node.caracter)  # Se ja existir o caracter na lista
                                $lista_nos[index].peso = $lista_nos[index].peso + 1 #incrementa a frequencia
                                estaNaLista = 1 #flag se esta na lista

                        end #if

                        index = index + 1 #posição na lista
                    end #for

                    if(estaNaLista == 0)
                            $lista_nos[$lista_nos.length] = node #adiciona uma posição na lista
                    end # if
            end #else
        end # def verifica

        def ordena_lista
            cont_i = 0
            cont_j = 0

            $lista_nos.each do |i| #insertion
                    atual = $lista_nos[cont_i]

                    cont_j = cont_i -1

                    while (cont_j >= 0) & ($lista_nos[cont_j].peso > atual.peso)

                            $lista_nos[cont_j + 1] = $lista_nos[cont_j]
                            $lista_nos[cont_j] = atual

                            cont_j = cont_j - 1
                    end#end while

                    cont_i = cont_i + 1
            end #end for
        end#ordena_lista

        def monta_arvore
                while $lista_nos.length > 1
                        node0 = $lista_nos[0]
                        node1 = $lista_nos[1]

                        node0.bin = 0 # nó a esquerda
                        node1.bin = 1 # nó a direita

                        auxLista = []
                        contListaNos = 0
                        contAuxLista = 0

                        novoNo = Node.new(nil, node0, node1, node0.peso+node1.peso, nil, nil)

                        $lista_nos.each do | i |
                                if(contListaNos == 0 || contListaNos ==1)
                                        contListaNos = contListaNos + 1
                                 elsif
                                        auxLista[contAuxLista] =$lista_nos[contListaNos]
                                        contListaNos = contListaNos + 1
                                        contAuxLista = contAuxLista + 1
                                end #else
                        end #for

                        auxLista[contAuxLista] = novoNo #adiciona o novo nó

                        $lista_nos = []
                        cont = 0

                        auxLista.each do | j | #volta os nós para a lista
                                $lista_nos[cont] = auxLista[cont]
                                cont = cont + 1
                        end #for

                        ordena_lista #ordena a lista novamente

                end #while

                $lista_nos[0].bin = 1 #raiz recebe 1
        end #cria_arvore_unica

       $arvore_decode = nil
        def decodifica(cabecalho)
                linha = cabecalho.split("")
                cont = 0
                caminho_atual = []
                puts linha.length
                while(linha.length > cont) # para todo o cabeçalho
                        while((linha[cont] == '0') or (linha[cont] =='1' )) #encontra uma letra
                                caminho_atual.push(linha[cont])
                                cont = cont + 1
                               # puts "adicionando caminho"
                        end#while

                        caminho_atual.push(linha[cont])
                         cont = cont + 1

                        #puts caminho_atual.join("")
                        insere_arvore_decode(caminho_atual) # insere na arvore

                        caminho_atual = [] #nova palavra
                end #while
        end #decodifica

        def insere_arvore_decode(caminho_atual)

            contador = 0

            if($arvore_decode == nil)
                    $arvore_decode = Node.new(nil, nil, nil, 0, 1, nil)
                    contador = contador + 1
                    #puts "Inseriu raiz"
            else
                    contador = contador + 1
                    #puts "Passou raiz"
            end # else

            node_atual = $arvore_decode

            while( caminho_atual.length  > contador)
                    #puts "Contador"
                    #puts contador
                    #puts caminho_atual[contador]

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

end #Lista_Modulo

class Principal
    include Lista_Modulo
    include Decodificador
end #class

Principal.new.ler_arquivo_codifica("arquivo.txt")

Principal.new.monta_arvore


#Principal.new.pre_order($lista_nos[0])
Principal.new.encontra_caminho_caracter($lista_nos[0])
Principal.new.pre_order($lista_nos[0])
#Principal.new.arvore_parentizada($lista_nos[0])
#puts $arvoreLinha.join("")
Principal.new.cria_cabecalho($lista_nos[0])
puts $cabecalho.join("")

puts "--------------decode ----------------"
Principal.new.decodifica($cabecalho.join(""))

Principal.new.pre_order($arvore_decode)

#Principal.new.monta_arvore