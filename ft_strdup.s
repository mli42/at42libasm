# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/27 18:44:49 by mli               #+#    #+#              #
#    Updated: 2020/06/03 01:53:31 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

extern _ft_strlen
extern _ft_strcpy
extern _malloc
extern ___error

		global _ft_strdup
		section .text

_ft_strdup:
	push	rdi			; save src

	call	_ft_strlen
	mov		rdi, rax
	inc		rdi			; len = ft_strlen(s1) + 1
	call	_malloc		; rax = malloc(ft_strlen(src) + 1)
	jc		exit_error

	mov		rdi, rax
	pop		rsi
	call	_ft_strcpy	; ft_strcpy(dest, src)
	ret

exit_error:
		call	___error
		mov		QWORD [rax], 12
		mov		rax, 0
		ret
