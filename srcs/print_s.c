/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   print_s.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pvandamm <pvandamm@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/30 18:29:38 by pvandamm          #+#    #+#             */
/*   Updated: 2018/11/30 18:49:37 by pvandamm         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
#include <unistd.h>

static int	split(t_flags flags, int j, char *s)
{
	int		i;

	i = 0;
	while (flags.field_width && flags.field_width - i > j && !(flags.minus))
	{
		ft_putchar(flags.zero ? '0' : ' ');
		i++;
	}
	j = 0;
	if ((int)ft_strlen(s) > flags.precision && flags.precision != -1)
	{
		while (j < flags.precision && s[j])
		{
			ft_putchar(s[j]);
			i++;
			j++;
		}
	}
	else
		i += (int)write(1, s, ft_strlen((char *)s));
	return (i);
}

int			print_s(va_list ap, t_flags flags)
{
	char		*s;
	int			i;
	int			j;

	i = 0;
	s = va_arg(ap, char *);
	if (!s)
	{
		free(s);
		s = "(null)";
	}
	if (flags.precision == -1)
		flags.precision = 0;
	else if (flags.precision == 0)
		flags.precision = -1;
	j = ((int)ft_strlen(s) > flags.precision && flags.precision != -1) ?
		flags.precision : (int)ft_strlen(s);
	i += split(flags, j, s);
	while (flags.field_width && flags.field_width > j && flags.minus)
	{
		ft_putchar(' ');
		flags.field_width--;
		i++;
	}
	return (i);
}
