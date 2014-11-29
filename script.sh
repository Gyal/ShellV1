#!/bin/sh

#Script permettant le renommage des lettres f en g, des noms des fichiers ayant plus de 10 lignes. 


#Affiche la demande de saisie du répertoire, la commande read récupère la saisie de l'utilisateur
echo "Entrez le nom du répertoire où chercher le fichier";
read directoryName;
echo "Voici l'ensemble des fichiers, situé dans le dossier" $directoryName ":";

#Affichage du nom des fichiers dès qu'un fichier est trouvé
for i in $(find ./$directoryName -name '*f*');
	do 
		nameFile=$(basename $i);
		echo $nameFile;

done;
echo "Les fichiers contenant plus de 20 lignes et dont leurs noms contiennent un f sont :";

#Lance la boucle pour chaque ficher d'on le nom contient un f
for i in $(find ./$directoryName -name '*f*');
    do
	count=$(cat $i | wc -l); #compte le nombre de ligne du 
    	nameFile=$(basename $i); #isole et stock le nom du fichier

	if [ $count -gt 10 ];
  		then
			echo 'Le fichier nommé: ' $nameFile ":" $count "lignes.";
			echo "Etes vous sur de vouloir renommer les lettres f de son nom en lettre g 0/N?";
			read choice; #Récupère la saisie du clavier
			if [ "$choice" = "O" ]; #Si le choix est O alors;
				then
					mv $i $(echo $i | sed 's/f/g/g'); #Modifie les lettres f en lettres g du nom de chaque fichier
					echo "Le fichier à été renommé";
				else 
					echo "Le fichier n'a pas été renommé";
			fi;
	fi;
done;

