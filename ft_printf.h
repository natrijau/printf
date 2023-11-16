/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: natrijau <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/01 16:46:12 by natrijau          #+#    #+#             */
/*   Updated: 2023/11/16 16:22:02 by natrijau         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdlib.h>
# include <unistd.h>
# include <stdarg.h>

int	ft_printf(const char *list, ...);
void	ft_putchar_fd(char c, int fd);
void	ft_putstr_fd(char *s, int fd);
void	ft_put_hexa(char *s);
void	ft_putnbr_unsigned_fd(unsigned int n, int fd);
void	ft_put_hexa_maj(int n);
void	ft_put_hexa_min(int n);
void	ft_pointer_hexa(unsigned long long n);
void	ft_putnbr_fd(int n, int fd);
size_t	ft_strlen(const char *str);
#endif
