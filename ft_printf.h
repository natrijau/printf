/* ~<(o )___ ====================================coincoin====== ___( o)>~ */
/*   ( ._> /                                                    \ <._ )   */
/*    `---'                                                       `---`   */
/*                                                                        */
/*   ft_printf.h                                                          */
/*   By: natrijau                                                         */
/*   Created: 2026/09/30 00:34:06                                         */
/*   Updated: 2026/09/30 00:34:06                                         */
/*                                                                        */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

#include <stdlib.h>
#include <unistd.h>
#include <stdarg.h>

/* --------------------------------- Main ----------------------------------- */

/* Fonction principale, gere le formatage et l'affichage. */
int		ft_printf(const char *format, ...);

/* ---------------------------- Output functions ----------------------------- */

/* Affiche un caractere. Retourne 1. */
int		ft_putchar(char c);

/* Affiche une chaine (gere NULL -> "(null)"). Retourne le nombre de caracteres ecrits. */
int		ft_putstr(char *s);

/* --------------------------- Conversion functions --------------------------- */

/* Affiche un entier signe. Retourne le nombre de caracteres ecrits. */
int		ft_nbr(int n);

/* Affiche un entier non signe. Retourne le nombre de caracteres ecrits. */
int		ft_nbr_unsigned(unsigned int n);

/* Affiche un entier non signe en hexadecimal minuscule. */
int		ft_hexa_min(unsigned int n);

/* Affiche un entier non signe en hexadecimal majuscule. */
int		ft_hexa_maj(unsigned int n);

/* Affiche une adresse pointeur au format "0x..." ou "(nil)". */
int		ft_pointer_hexa(unsigned long long n);

/* Affiche un nombre flottant (précision fixe 6 décimales). */
int		ft_float(double n);

/* ------------------------------- Misc --------------------------------------- */

/* Affiche le caractere '%%'. Retourne 1. */
int		ft_percent(void);

#endif