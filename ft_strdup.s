# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/27 18:44:49 by mli               #+#    #+#              #
#    Updated: 2020/04/06 15:18:01 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

extern _ft_strlen
extern _ft_strcpy
extern _malloc

		global _ft_strdup

_ft_strdup:
	push	rdi			; save src

	call	_ft_strlen
	mov		rdi, rax
	inc		rdi			; len = ft_strlen(s1) + 1
	call	_malloc		; rax = malloc(ft_strlen(src) + 1)

	cmp		rax, 0		; if (rax == NULL) -> return (NULL)
	jz		_ft_strdup_end

	mov		rdi, rax
	pop		rsi
	call	_ft_strcpy	; ft_strcpy(dest, src)

_ft_strdup_end:
	ret
