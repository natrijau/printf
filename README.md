# ft_printf

Réimplémentation en C de la fonction standard `printf`, réalisée dans le cadre de l'école 42 par **natrijau**. Le projet fournit une bibliothèque statique capable de formater et d'afficher différents types de données via une interface proche de `printf`.

## Table des matières

- [Présentation](#présentation)
- [Fonctionnalités](#fonctionnalités)
- [Architecture du projet](#architecture-du-projet)
- [Installation](#installation)
- [Commandes Makefile](#commandes-makefile)
- [Utilisation](#utilisation)
- [Section Makefile](#section-makefile)
- [Auteur](#auteur)
- [Licence](#licence)

## Présentation

`ft_printf` reproduit le comportement essentiel de `printf` en proposant une fonction variadique et une bibliothèque statique nommée `libftprintf.a`. L'implémentation est organisée par responsabilité afin de séparer l'analyse du format, les fonctions de sortie et les conversions numériques.

## Fonctionnalités

Les spécificateurs suivants sont gérés :

| Spécificateur | Description |
|---|---|
| `%c` | Affiche un caractère. |
| `%s` | Affiche une chaîne de caractères. |
| `%d` | Affiche un entier signé en base 10. |
| `%i` | Affiche un entier signé en base 10. |
| `%u` | Affiche un entier non signé en base 10. |
| `%x` | Affiche un entier en hexadécimal avec des lettres minuscules. |
| `%X` | Affiche un entier en hexadécimal avec des lettres majuscules. |
| `%p` | Affiche une adresse mémoire en hexadécimal précédée de `0x`. |
| `%f` | Affiche un nombre flottant. |
| `%%` | Affiche le caractère `%`. |

Cas particuliers pris en charge :

- Une chaîne nulle passée à `%s` est représentée par `(null)`.
- Un pointeur nul passé à `%p` est représenté par `(nil)`.
- `INT_MIN` est traité correctement malgré son impossibilité à être converti directement en valeur positive dans un type `int` signé.
- La valeur de retour correspond au nombre de caractères écrits, sans compter le caractère nul final lorsqu'une chaîne est concernée.

## Architecture du projet

```text
ft_printf/
├── ft_printf.h
├── Makefile
├── src/
│   ├── main/
│   │   └── ft_printf.c
│   ├── output/
│   │   ├── ft_putchar.c
│   │   ├── ft_putstr.c
│   │   └── ft_putnbr.c
│   ├── convert/
│   │   ├── ft_nbr_unsigned.c
│   │   ├── ft_hexa_min.c
│   │   ├── ft_hexa_maj.c
│   │   ├── ft_pointer_hexa.c
│   │   └── ft_float.c
│   └── format/
│       └── ft_percent.c
└── obj/
    └── ...
```

Le dossier `obj/` contient les fichiers objets générés par la compilation. Son organisation reprend en miroir l'arborescence de `src/`.

## Installation

Clonez le dépôt, puis compilez la bibliothèque :

```bash
git clone <url-du-depot> ft_printf
cd ft_printf
make
```

La commande `make` génère :

- `libftprintf.a`, la bibliothèque statique à lier avec votre programme ;
- `obj/`, le dossier contenant les fichiers objets intermédiaires.

## Commandes Makefile

| Commande | Description |
|---|---|
| `make` | Compile le projet et génère `libftprintf.a`. |
| `make all` | Exécute la compilation complète. |
| `make clean` | Supprime les fichiers objets et le dossier `obj/`. |
| `make fclean` | Supprime les fichiers objets, le dossier `obj/` et `libftprintf.a`. |
| `make re` | Effectue un nettoyage complet, puis recompile le projet. |
| `make help` | Affiche l'aide et les commandes disponibles. |

## Utilisation

Incluez l'en-tête du projet dans votre fichier C :

```c
#include "ft_printf.h"
```

Compilez votre programme en indiquant le chemin de la bibliothèque et son nom :

```bash
gcc -Wall -Wextra -Werror -I. main.c -L. -lftprintf -o exemple
```

La liaison avec la bibliothèque peut également être écrite sous la forme demandée par le projet :

```bash
gcc main.c -L. -lftprintf -I. -o exemple
```

Exemple de code :

```c
#include "ft_printf.h"

int main(void)
{
    int count;

    count = ft_printf("Nom : %s | Valeur : %d | Hexadécimal : %x\\n",
        "ft_printf", 42, 42);
    ft_printf("Caractères écrits : %d\\n", count);
    return (0);
}
```

Sortie attendue :

```text
Nom : ft_printf | Valeur : 42 | Hexadécimal : 2a
Caractères écrits : 49
```

La valeur exacte retournée par `ft_printf` dépend du texte affiché et peut être vérifiée directement dans le programme. Dans cet exemple, elle correspond au nombre de caractères de la première ligne, caractère de nouvelle ligne compris.

## Section Makefile

Le Makefile compile le projet avec les options suivantes :

```text
-Wall -Wextra -Werror -g -I.
```

- `-Wall` active les avertissements courants ;
- `-Wextra` active des avertissements supplémentaires ;
- `-Werror` transforme les avertissements en erreurs ;
- `-g` ajoute les informations utiles au débogage ;
- `-I.` indique le répertoire courant pour la recherche des fichiers d'en-tête.

Les fichiers sources sont convertis en fichiers objets dans `obj/`, selon une organisation en miroir de `src/`. Les fichiers objets sont ensuite archivés dans `libftprintf.a`.

## Auteur

- **Nom :** natrijau
- **Établissement :** école 42

## Licence

Projet pédagogique réalisé dans le cadre de l'école 42. Aucune licence de distribution spécifique n'est définie au-delà des règles applicables au projet pédagogique.
