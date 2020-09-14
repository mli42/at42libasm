# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/14 11:40:27 by mli               #+#    #+#              #
#    Updated: 2020/09/14 11:55:24 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		global ft_write
		extern __errno_location
		section .text

ft_write:
		mov		rax, 1
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
