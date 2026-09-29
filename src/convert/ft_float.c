#include "../../ft_printf.h"

static long long	ft_pow10(int n)
{
    long long	res;

    res = 1;
    while (n-- > 0)
        res *= 10;
    return (res);
}

static int	ft_print_decimals(long long dec, int nb_digits)
{
    long long	div;
    int			count;
    int			i;

    count = 0;
    div = ft_pow10(nb_digits - 1);
    i = 0;
    while (i < nb_digits)
    {
        ft_putchar((dec / div) % 10 + 48);
        div /= 10;
        count++;
        i++;
    }
    return (count);
}

int	ft_float(double n)
{
    int			count;
    long long	part_int;
    long long	part_dec;
    double		tmp;

    count = 0;
    if (n < 0)
    {
        ft_putchar('-');
        count++;
        n = -n;
    }
    part_int = (long long)n;
    tmp = (n - (double)part_int) * ft_pow10(6);
    part_dec = (long long)(tmp + 0.5);
    if (part_dec >= ft_pow10(6))
    {
        part_int++;
        part_dec = 0;
    }
    count += ft_nbr_unsigned((unsigned int)part_int);
    ft_putchar('.');
    count++;
    count += ft_print_decimals(part_dec, 6);
    return (count);
}