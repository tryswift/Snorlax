# Créer une librairie

Voici une liste de points pratiques à suivre lors de la création d'une librairie. Elle est adaptée pour des librairies qui s'appliquent à la plupart des plateformes. Si certaines étapes ne s'appliquent pas à votre cas, ignorez-les.

- Modifications de code
    - Assurez-vous de marquer votre API comme "publique"
    - Assurez-vous d'avoir un fichier "LICENCE"
- Création de framework avec xCode
    - Assurez-vous que le système est "partagé"
    - Assurez-vous que tous les frameworks possèdent le même "nom de produit" (PRODUCT_MODULE_NAME) dans les paramètres de "build"
    - Assurez-vous que tous les fichiers sources sont dans le "Target Membership" de chaque framework.
        - Et que chaque fichier test est dans le "Framework's Test Bundle"
    - Note: les framework de type "watchOS" n'ont pas de fichiers de test
- Gestionnaires de packets
    - CocoaPods
        - Exécutez `pod spec create <nom du projet>`
        - Modifiez le fichier `<Project>.podspec`
            - Choisissez une version
            - Ajoutez une description
            - Ajoutez les dépendances
            - Spécifiez les fichiers sources
    - Carthage
        - Exécutez `carthage build --no-skip-current` pour vérifier si Carthage peut créer votre librairie
        - Restreindre les autorisations
        - Les dépendances pour les librairies utilisateur sont dans `Cartfile`
        - Les dépendances pour le développement de vos librairies sont dans `Cartfile.private` (Optionnel)
    - Gestionnaire de packets Swift
        - Toutes les sources doivent être dans `Sources/<target name>`
        - Tous les tests doivent être dans `Tests/<target name>`
        - Le "target name" est défini dans le fichier `Package.swift`
        - Ajouter un fichier `Tests/LinuxMain.swift` pour "boostraper" les tests swift sous Linux
        - Tous vos "XCTests" doivent inhériter de `XCTestCaseProvider`
            - Et fournir les `allTest` accesseurs qui spécifient les tests à éxécuter
        - `#if _runtime(_ObjC)` peut être utilisé pour exclure du code sous linux
        - Utiliser [swiftenv][swiftenv] pour les tests swift "anti multi-versions" et pour autoriser une synchronisation simplifiée de votre version swift supportée avec CI.
- Dépendances
    - Pour les développeurs qui souhaitent intégrer votre librairie manuellement, utilisez les modules secondaires de git. Cela peut être fait manuellement ou avec le flag Carthage: `--use-submodules`.
    - Utilisez votre espace de travail pour séparer les dépendances de votre projet xCode lorsque vous en ajoutez en sous-projet.
- Intégration continue / Test
    - Utilisez `xcodebuild test ...` pour lancer des tests dans xCode via la ligne de commande
    - Utilisez `swift build && swift test` pour lancer des tests dans le gestionnaire de packets Swift
    - Travis CI - Voir la [documentation][travis-ci]
        - Ajoutez un fichier `.travis.yml` à la racine du répertoire.
        - Vous pouvez supporter Linux, voir l'exemple ci-dessous.
        - Construisez votre répertoire via Travis.

Tout est OK? La suite [Spécificités GitHub](ici: Github.md).

# Examples


Un `Package.swift` minimal:

```swift
import PackageDescription

// Les sources sont dans le répertoire Sources/MyPackage
// Les tests sont dans le répertoire Tests/MyPackage
let package = Package(
    name: "MyPackage"
)
```

Un fichier `.travis.yml` avec Swift Linux + OS X Swift + OS X Xcode:

```yaml
osx_image: xcode7.2
language: generic
matrix:
  include:
    - os: osx
      env: TYPE=xcode
    - os: osx
      env: TYPE=spm
    - os: linux
      dist: trusty
      sudo: required
      env: TYPE=spm
install: if [[ "$TYPE" == "spm" ]]; then eval "$(curl -sL https://gist.githubusercontent.com/kylef/5c0475ff02b7c7671d2a/raw/02090c7ede5a637b76e6df1710e83cd0bbe7dcdf/swiftenv-install.sh)"; fi
script:
  - ./run-tests $TYPE # Les script de test peut être "dispatché" pour corriger les commandes de test à lancer
```