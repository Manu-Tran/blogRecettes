# Blog de Recettes du CGNan

Ce dépôt a pour but d'accueillir les recettes des différents membres du CGNan. 

## Comment ça marche ?

En cas de changements, le site pull le repo et se met automatiquement à jour. Cela se fait par un wabhook et un service dédié à ce méchanisme.
Les recettes dans le format markdown sont ensuite parsés et mis en page via des templates HTML, puis mis à dispositioon par le serveur. Ce mécanisme est rendu possible par le framework Pélican.

## Comment ajouter ma recette ?

Pour pouvoir avoir les accès, soit me contacter directement (si vous comptez contribuer souvent), soit faire une PR (pour des modifications occasionelles).

### La méthode simple

La méthode simple consiste à passer par l'interface github. 
Sur la [https://github.com/Manu-Tran/blogRecettes][page principale du repo], utiliser le "Add File" puis l'option adéquate.
Pour le nom du fichier, bien vérifier que le nom du fichier contient bien le chemin vers les recettes (Vérifier que le nom de la recette ajoutée commence bien par `recettes/`).
Ensuite, après avoir mis un nom de commit, il suffit de cliquer sur le gros bouton vert.

Pour modifier, c'est presque identique. Il suffit de cliquer sur la recette à modifier et cliquer sur le bouton editer en haut à droite.

### La méthode un peu moins simple

Pour cette méthode, les modifications sont locales (utilisant l'éditeur de votre choix). Un fois que vous avez tapé la recette en locale et mis dans le bon fichier du repo (`blogRecettes/recettes/`), vous pouvez lancer le script prévu à cet effet : depuis le root du repo `./sendRecipes`.
Normalement, le chagement devrait opérer dans la minute.

### La méthode pas simple

Utiliser l'outil `git` comme un grand. Voir [https://git-scm.com/docs/gittutorial][turoriel].
