=begin
     $codificadas = []
        def codificar_arquivo(nome)
                File.open(nome, 'r') do | f1|
                        while line = f1.gets
                                line.split("").each do | i |
                                        #encontra_caminho_arvore(i)
                                end # for
                        end #end while
                end #end File
        end #def ler_arquivo

        def encontra_caminho_arvore(node, caracter)
                if(node != nil)
                       if (node.caracter != nil)
                                if(node.caracter == caracter)
                                        codificadas.push(node.caminho.join("")) #adiciona a codificacao
                                end # if
                        end #if

                        encontra_caminho_arvore(node.left)
                        encontra_caminho_arvore(node.right)
                end #if
        end #encontra_caminho_arvore
 end#module
 =end