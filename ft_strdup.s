# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/27 18:44:49 by mli               #+#    #+#              #
#    Updated: 2020/09/14 12:12:25 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

extern ft_strlen
extern ft_strcpy
extern malloc
extern __errno_location

		global ft_strdup
		section .text

ft_strdup:
	push	rdi			; save src

	call	ft_strlen
	mov		rdi, rax
	inc		rdi			; len = ft_strlen(s1) + 1
	call	malloc		; rax = _malloc(ft_strlen(src) + 1)
	pop		rsi

	cmp		rax, 0		; _malloc protection
	je		exit_error

	mov		rdi, rax
	call	ft_strcpy	; ft_strcpy(dest, src)
	ret

exit_error:
		push	rax		; crash if I do 'mov rax, 0'
		call	__errno_location
		mov		QWORD [rax], 12
		pop		rax
		ret
