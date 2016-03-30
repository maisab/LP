load 'arvore.rb' #importa o arquivo

$lista_nos = []

module Lista_Modulo
       include BinaryTree

        def ler_arquivo(nome)
                File.open(nome, 'r') do | f1|
                        while line = f1.gets
                                #puts line
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
                        node = Node.new(i, nil, nil, 1)
                        #puts " ------------- Novo No ---------------"
                        verifica_lista(node)

                end # end for each
        end # def insere

        #  Função adiciona os nós na lista
        #  Incrementa a frequencia dos ja adicionados
        def verifica_lista(node)
            if($lista_nos.length == 0) #inicializa a lista
                    #puts "Caracter "
                    #puts node.caracter
                    #puts "------- Adicionou o primeiro --------"
                    $lista_nos[0] = node

            else
                    estaNaLista = 0
                    index = 0

                    $lista_nos.each do | item|
                        if(item.caracter == node.caracter)  # Se ja existir o caracter na lista
                                #puts " ---         Encontrou o caracter   na lista-----"
                                #puts node.frequencia
                               # puts node.caracter
                                $lista_nos[index].frequencia = $lista_nos[index].frequencia + 1 #incrementa a frequencia
                                estaNaLista = 1 #flag se esta na lista

                        end #if

                        index = index + 1 #posição na lista

                    end #for

                    if(estaNaLista == 0)
                            #puts "---------Adiciona na lista --------"
                            #puts node.caracter

                            $lista_nos[$lista_nos.length] = node #adiciona uma posição na lista
                    end # if
            end #else
        end # def verifica




end #Lista_Modulo

class Principal
    include Lista_Modulo
end #class

Principal.new.ler_arquivo("arquivo.txt")

$lista_nos.each do | i |
    puts "Caracter , Frequencia"
    puts i.caracter
    puts i.frequencia
    puts "  ------------------   "
end
