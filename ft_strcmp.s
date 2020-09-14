# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/14 11:39:10 by mli               #+#    #+#              #
#    Updated: 2020/09/14 11:39:18 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	global ft_strcmp
	section .text

ft_strcmp:
		cmp byte [rdi], 0
		je end

		cmpsb			; cmp rdi, rsi and THEN inc them
		je ft_strcmp	; if equal, reloop

		dec rdi
		dec rsi

end:
		movzx rax, byte [rdi]
		movzx rcx, byte [rsi]
		sub rax, rcx
		ret
