/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_put_hexa_min.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: natrijau <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/16 09:55:36 by natrijau          #+#    #+#             */
/*   Updated: 2023/11/16 10:04:28 by natrijau         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	ft_put_hexa_min(int n)
{
	if (n > 15)
		ft_put_hexa_min(n / 16);
	if (n >= 0 && n <= 9)
		ft_putchar_fd(n + 48, 1);
	else if (n >= 10 && n < 16)
		ft_putchar_fd(n + 87, 1);
	if (n > 15)
		ft_put_hexa_min(n % 16);
}
