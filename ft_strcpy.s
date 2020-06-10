# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/26 21:02:42 by mli               #+#    #+#              #
#    Updated: 2020/06/11 00:06:32 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	global _ft_strcpy
	section .text

_ft_strcpy:
	push	rdi

ft_str_do_cpy:
	movsb
	cmp		[rsi - 1], byte 0
	je		ft_strcpy_end
	jmp		ft_str_do_cpy

ft_strcpy_end:
	pop		rax
	ret

