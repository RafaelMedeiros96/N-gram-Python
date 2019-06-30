import glob
import nltk
from nltk.util import ngrams
import ConexaoPost
import FiltroDados


#Listar arquivos todos da pasta

for i in glob.glob("E:\\ProjetoTCC\\*"):
    raw=FiltroDados.filtro(i)

    token = nltk.word_tokenize(raw)

    #Solução para criação de novos NGRAM com mais de 3 palavras
    #bgs = ngrams(token, 1) #Word List
    bgs = ngrams(token, 2)
    #bgs = ngrams(token, 3)
    #bgs = ngrams(token, 4)

    #Computar a frequencia dos NGRAM e exibi o Token
    fdist = nltk.FreqDist(bgs)
    freq=0

    # Variavel "X" guarda a palavra, Variavel "Y" guarda a frequencia. Serão salvas no BD.
    for x1, y2 in fdist.items():
        freq=freq+y2

    for x,y in fdist.items():
        palavra = str(x).replace("'", "").replace(")", "").replace("(", "").replace(",", "")

        print('Termo:', palavra, 'Frequencia:', y)

        # Salvar informações no BD
        ConexaoPost.cur.execute("INSERT INTO Léxico (gram, length, frequency, total, algorithm_idalgorithm, publication_idpublication)VALUES(%s,%s,%s,%s,%s,%s)", (palavra, 2,(y/freq)*100, freq, 1, 1))
        ConexaoPost.con.commit()
    # Fecha o BD
    ConexaoPost.con.close

print("*** FIM ***")
