# Spécificités GitHub

GitHub peut traiter les fichiers à la racine de votre répertoire de manière spécifique. De nombreuses options permettent à une extension de spécifier à GitHub la manière dont il doit interpréter le contenu du fichier. Par exemple, `README.md` indique un [gitHub markdown][markdown] README tandis que `README.rst` indique un README écris en [texte restructuré][restructured]. Il y a d'autres extensions supportées [listed in GitHub][gh-markup]. Si vous ne connaissez pas laquelle choisir, favorisez markdown.

- Assurez-vous d'avoir un `README` a la racine de votre répertoire qui sera affiché juste en dessous de votre code source dans GitHub. Il est recommandé d'avoir:
    - Une description de votre projet
    - Comment l'installer? Quelle est la dernière version?
    - Quelle version de Swift est recquise?
    - Quelques exemples d'utilisation
    - Une documentation de type API / le concept (éventuellement dans un fichier externe)
- Assurez-vous d'avoir un fichier `LICENSE` qui spécifie les droits alloués aux utilisateurs qui utilisent votre librairie. Il est fortement recommandé d'avoir une licence explicite car certains pays (ex: US) utilisent le "copyright" par défaut.
    - Les licences de type "Copyleft" (ex - GPL) sont interdites sur les stores applicatifs
    - Dans le doute, utilisez [MIT][mit] ou [Apache][apache]
        - "MIT" est le plus simple, préféré par de nombreux développeurs et sociétés.
        - "Apache" est rédigé par des avocats, mais il est similaire à "MIT" sauf pour les mentions suivantes:
            - Des attributions sont recquises avec les licences "Apache" y compris dans
                - Le produit final
                - Les sources qui auraient été modifiées mais qui étaient initialement comprises dans la licence.
            - Inclure une clause d'attribution de brevet qui implique que vous ne pouvez pas être poursuivi par un contributeur qui aurait ajouté du code breveté.
- Ajouter un fichier `CONTRIBUTING` pour définir une procédure pour les personnes souhaitant contribuer à votre projet:
    - Quel est le code de conduite de ce projet?
    - Quel est le style de codage recommendé?
    - Comment décrire un problème?
        - Les étapes pour reproduire l'apparition du problème
        - La version du logiciel utilisée (librairie et dépendances)
        - Un court exemple qui démontre le problème
        - La raison pour laquelle une fonctionnalité particulière serait utile? Des exemples sont-ils nécessaires?
    - Comment réaliser une "pull request"
        - Comment sont organisés les différents "commits"
            - Un historique concis est-il important?
            - Lors d'une "pull request", de nouveaux tests sont-ils nécessaire lors de l'ajout de nouvelle fonctionnalités? (Recommendé)
        - Quelle est la structure préférée pour effectuer une "pull request"?
        - Y a t-il des fichiers particuliers qui seront altérés par la plupart des "pull request" (ex: fichier de log)?
    - Préférez-vous l'ouverture d'une discussion GitHub avant la création d'une "pull request" ou le contraire?
    - L'équipe
        - Comment les contributeurs ayant les droits d'accès doivent se comporter?
        - Est-il nécessaire que tous les membres participe à la vérification d'une "pull request"?
        - Comment les membres de l'équipe procèdent-ils pour la publication de nouvelles releases?
            - Lors de l'ajout de versions, où doivent se situer les modifications?
            - Utilisez-vous [semver][semver]? (Recommandé)

[gh-markup]: https://github.com/github/markup
[markdown]: https://help.github.com/articles/basic-writing-and-formatting-syntax/
[restructured]: http://docutils.sourceforge.net/rst.html
[semver]: http://semver.org/
[mit]: https://opensource.org/licenses/MIT
[apache]: https://opensource.org/licenses/Apache-2.0
[travis-ci]: https://docs.travis-ci.com/user/languages/objective-c
