.text
	addi a0, gp, 0 # Iniciando vetor na posicao 0, com global pointer
	addi s0, zero, 20 # Registrador global recebe tamanho do vetor
	addi t0, zero, 1 # Registrador temporario recebe 1 elemento
	addi t1, zero, 1 # Registrafor temporario recebe 2 elemento
	jal fib # Pula para funcao fib
	
fib:
	addi s1, zero, 2 # Registrador global recebe o indice 2 do laco
	sw t0, 0(a0) # Armazena no endereco 0 o 1 elemento, v[0]
	sw t1, 4(a0) # Armazena no endereco 4 o 2 elemento, v[1]
	addi a0, a0, 4 # O endereco agora esta no v[2]
	jal fib_loop # Pula para funcao fib_loop
	
fib_loop:
	add t2, t0, t1 # Faz uma adicao do v[i - 1] com o v[i - 2] elemento
	sw t2, 4(a0) # Guarda o valor da variavel t2 na posicao v[a0] + 4
	addi a0, a0, 4 # O endereco novo de a0 é v[a0] + 4
	addi t0, t1, 0 # Guarda o elemento v[i - 2] em v[i - 1]
	addi t1, t2, 0 # Guarda o elemento t2 em v[i - 2]
	addi s1, s1, 1 # Faz i++
	bne s0, s1, fib_loop # Volta para fib_loop se indice e diferente do tamanho
	addi x0, x0, 0 # Aqui faz um HALT
