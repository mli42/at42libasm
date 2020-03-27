/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mli <mli@student.42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/24 21:00:58 by mli               #+#    #+#             */
/*   Updated: 2020/03/27 14:32:45 by mli              ###   ########.fr       */
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

void	ft_test_strcpy(char *s2)
{
	char s1[1024];

	memset(s1, '-', 1024);
	ft_printf("%s\n", ft_strcpy(s1, s2));
}

void	ft_test_strcmp(char *s1, char *s2)
{
	ft_printf("Mine %d\n", ft_strcmp(s1, s2));
	ft_printf("True %d\n", strcmp(s1, s2));
}

int		main(void)
{
//	ft_wr_len("123");
//	ft_wr_len("");
//	ft_wr_len("123456789ABCDEFGHIJKLMNOPQRSUVWXYZ");

//	ft_test_strcpy("");
//	ft_test_strcpy("12345");

//	ft_test_strcmp("12345", "12346");
//	ft_test_strcmp("", "");
//	ft_test_strcmp("12349", "12346");


	return (0);
}
