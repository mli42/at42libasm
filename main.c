/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mli <mli@student.42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/24 21:00:58 by mli               #+#    #+#             */
/*   Updated: 2020/03/26 13:41:43 by mli              ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// #include <inttypes.h>
#include "libasm.h"
int		ft_printf(const char *str, ...);

void	ft_wr_len(char *str)
{
	ft_printf("The sentence tested : [%s] | len : [%u]\n", str, strlen(str));
	ft_printf("\nWrite [%u]\n", ft_write(1, str, strlen(str)));
	ft_printf("Strlen [%u]\n\n", ft_strlen(str));
}

int		main(void)
{
//	ft_wr_len("123");
//	ft_wr_len("");
//	ft_wr_len("123456789ABCDEFGHIJKLMNOPQRSUVWXYZ");



	return (0);
}
