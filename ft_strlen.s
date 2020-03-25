# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/26 00:24:16 by mli               #+#    #+#              #
#    Updated: 2020/03/26 00:24:20 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	global _ft_strlen
	section .text

_ft_strlen:
	mov		rax, rdi

ft_strlen_nextchar:
	cmp		[rax], byte 0
	je		ft_strlen_end
	inc		rax
	jmp		ft_strlen_nextchar

ft_strlen_end:
	sub		rax, rdi
	ret
