# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/26 21:02:42 by mli               #+#    #+#              #
#    Updated: 2020/03/26 23:19:37 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	global _ft_strcpy
	section .text

_ft_strcpy:
	mov		rax, rdi

_ft_str_do_cpy:
	mov		r8b, [rsi]
	mov		[rdi], r8b
	cmp		[rsi], byte 0
	je		_ft_strcpy_end
	inc		rdi
	inc		rsi
	jmp		_ft_str_do_cpy

_ft_strcpy_end:
	ret

