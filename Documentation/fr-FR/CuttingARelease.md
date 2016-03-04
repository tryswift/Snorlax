# L'art du versionning

Publier une nouvelle version de votre librairie est très simple, mais soiyez sûr de documenter suffisamment votre projet pour permettre à chacun des membres de réaliser cette tâche correctement.

Publier une nouvelle version n'est pas compliqué, c'est de l'archivage des mises à jour, mais vous devez vous assurez de fournir une documentation adéquates aux personnes souhaitant utiliser votre librairie. Il est fortement recommandé d'utiliser du [versionning sémantique][semvar]. Les dévellopeurs utilisant votre librairie l'apprécieront lorsqu'ils souhaiteront être informés d'un type de mise à jour particulier.

Pour faire court, le "versioning sémantique" se fait au format suivant:

```
<major>.<minor>.<patch>
```

Par exemple `1.4.1`. Une incrémentation d'un des chiffres indique un type spécifique de modification qui est inclus dans la nouvelle version:

 - **Patch** indique une correction de bugs, il n'y a pas de nouvelle fonctionnalités ou de changements conséquents inclu dans ce type de version 
 - **Minor** indique qu'une nouvelle fonctionnalité a été ajoutée sans pour autant modifier l'API liée à votre librairie. Cela signifie que les utilisateurs peuvent mettre à jour leur version sans facilement et utiliser la ou les nouvelle(s) fonctionnalité(s). Ce type de version peut aussi inclure des corrections de bugs.
 - **Major** indique un changement majeur a été appliqué. Les développeurs qui utilisent votre librairie doivent s'attendre à des évolutions concernant l'API de votre librairie et doivent devront probablement mettre à jour leur version. Ce type d'update peut naturellement comprendre de nouvelles fonctionnalités ainsi que des corrections de bugs.

Carthage, Cocoapods, et le gestionnaire de packets Swift suivent ces règles et permettent aux développeurs de mettre à jour leurs librairies en leurs attribuant ce type de format.

Par exemple, avec Cocoapods:

```ruby
pod 'Snorlax', '~> 1.2.0'
```

L'opérator `~>` indiques à cocoapods de suivre les règles de versionning sémantiques en permettant au numéro de version spécifié d'être flexible (littérallement "cette version ainsi que ses derniers patchs") lorsque `pod update` est appelé.

Donc, si cocoapods a installé la version `1.2.0` de Snorlax et qu'une version `1.2.1` est publiée, cocoapods mettra à jour la librairie de l'utilisateur la prochaine fois que la commande `pod update` sera lancée.

Cependant, si la nouvelle version est liée à une mise à jour "mineure" (**minor**) ou "majeure" (**Major**), lancer la commande `pod update` ne mettre pas à jour la librairie, cette fonctionnalité est restreinte "patchs" ou "corrections de bugs".

## Vérifications

La liste suivante décris les vérifications à éffectuer avant de créer votre version:

 - Est-ce portable à toutes les plateformes?
   - Le plus simple est d'utiliser `carthage build --no-skip-current`
 - Tous les tests ont-ils été lancés et passés?

## Création de votre version

Notez-bien: Dans les étapes qui suivent, `Snorlax` doit être remplacé avec le nom de votre projet.

 - Mettez à jour votre numéro de version en respectant les règles de versionning sémantiques
   - Mettez à jour votre fichier `podspec`
   - Mettez à jour votre documentation, notamment la partie décrivant l'installation du projet.
 - Lancez un "push" de votre répertoire local vers le répertoire distant afin de le mettre à jour.
 - Créez un tag de votre version: `git tag v1.2.1 -a`
   - Une manière simple de voir les changements avec la dernière version taggée:
     `git diff v1.2.0...HEAD`
   - Ajoutez une description à votre tag relative aux modifications apportées
 - "Pushez" le tag au répertoire: `git push origin v1.2.1`
 - "Pushez" le "spec" de cocoapod: `pod trunk push Snorlax.podspec`
 - Rendez vous dans la sections des releases de GitHub et ajoutez la release liée au nouveau tag.

Vous pouvez automatiser la plupart de ces étapes([Quick][quick] et
[Nimble][nimble] proposent ce type d'automatisation).

## Crédits additionnels

- **Signature des tags**. Cela permet aux développeurs qui le souhaitent de s'assurer qu'ils lancent le code que vous avez validé. Vous devrez utiliser une clé PGP et lancer la commande `git tag -s v1.2.1`.

[semvar]: http://semvar.org
[quick]: https://github.com/Quick/Quick
[nimble]: https://github.com/Quick/Nimble
