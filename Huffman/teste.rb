load 'arvore.rb' #importa o arquivo

module Lista_Modulo
       include BinaryTree
       $lista_nos = []

        def ler_arquivo(nome)
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
                        node = Node.new(i, nil, nil, 1, 1, nil, nil)
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
                                $lista_nos[index].frequencia = $lista_nos[index].frequencia + 1 #incrementa a frequencia
                                $lista_nos[index].peso = $lista_nos[index].frequencia #peso igual a frequencia no inicio
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

                        novoNo = Node.new(nil, node0, node1, 0, node0.peso+node1.peso, nil, nil)

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
end #Lista_Modulo

class Principal
    include Lista_Modulo
end #class

Principal.new.ler_arquivo("arquivo.txt")

#$lista_nos.each do | i |
#         puts "Caracter"
#         puts i.caracter

#        puts "Peso"
#        puts i.peso

#end #for

 Principal.new.monta_arvore

#$lista_nos.each do | i |
#       puts "Caracter"
#       puts i.caracter

#        puts "Peso"
#       puts i.peso
#end #for

#puts "------- Agora arvore ------------"

Principal.new.pre_order($lista_nos[0])
Principal.new.encontra_caminho_caracter($lista_nos[0])
Principal.new.pre_order($lista_nos[0])
Principal.new.arvore_parentizada($lista_nos[0])
puts $arvoreLinha.join("")
#Principal.new.monta_arvore