# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/14 11:41:49 by mli               #+#    #+#              #
#    Updated: 2020/09/14 11:41:51 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	global ft_strlen
	section .text

ft_strlen:
	mov		rax, rdi

ft_strlen_nextchar:
	cmp		[rax], byte 0
	je		ft_strlen_end
	inc		rax
	jmp		ft_strlen_nextchar

ft_strlen_end:
	sub		rax, rdi
	ret
