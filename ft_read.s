# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/27 16:01:12 by mli               #+#    #+#              #
#    Updated: 2020/09/14 11:55:51 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		global ft_read
		extern __errno_location
		section .text

ft_read:
		mov		rax, 0
		syscall
		cmp		rax, 0
		jl		exit_error
		ret
exit_error:
		neg		rax
		push	rax
		call	__errno_location
		pop		QWORD [rax]
		mov		rax, -1
		ret
