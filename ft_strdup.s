# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/27 18:44:49 by mli               #+#    #+#              #
#    Updated: 2020/06/07 19:08:32 by mli              ###   ########.fr        #
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
	pop		rsi

	cmp		rax, 0		; malloc protection
	je		exit_error

	mov		rdi, rax
	call	_ft_strcpy	; ft_strcpy(dest, src)
	ret

exit_error:
		push	rax		; crash if I do 'mov rax, 0'
		call	___error
		mov		QWORD [rax], 12
		pop		rax
		ret
