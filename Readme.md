#Cheques

Programme console qui imprime des chèques en euros grace au **gem number_to_words**.


La classe Cheque garde en mémoire les caratéristiques du chéque (banque, taille, positions des item etc)

cic = Cheque.new('CIC')

On passe à ChequeWriter la le type de chéque, le montant et le bénéficiaire.

(Encore le Trésor Public !)

mon_cheque = ChequeWriter.new(cic,28.95,'Tresor Public' )

Puis generate_pdf écrit le chèque prêt à imprimer.

mon_cheque.generate_pdf

Le projet n'est pas terminé, il fauut placer précisément les items sur le chèque.
Il faudrait effectivement faire un programme en ligne de commande qui accepte les arguments (p ex thor)
voire ultime avatar: un GUI !
