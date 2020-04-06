#Laboratory Exercise 5, Home Assignment 2 
.data 
	x:	.space 1000                     	# destination string x, empty 
	y: 	.asciiz "Hung dep trai"                 	# source string y 
 
.text 
	la	$a0, x					# g�n dia chi cua chuoi x vao a0
	la	$a1, y 					# gan dia chi cua chuoi y vao a1
strcpy:  
	add	$s0,$zero,$zero         		#s0 = i=0 	#bien i gan bang 0
L1:  							# doc tung bit cua chuoi roi chep vao x
	add	$t1,$s0,$a1             		#t1 = s0 + a1 = i + y[0]        #luu dia chi cua y[0 + i] vao t1                             
				    			# = address of y[i]  		
	lb 	$t2,0($t1)              		#t2 = value at t1 = y[i]  	#ch�p gi� tr? c?a y[i] v�o t2
	add 	$t3,$s0,$a0             		#t3 = s0 + a0 = i + x[0]        # luu dia chi cua x[i] vao t3                            
							#   = address of x[i]  
	sb 	$t2,0($t3)              		#x[i]= t2 = y[i]  		#copy cai dia chi cua t3 vao t2
	beq 	$t2,$zero,end_of_strcpy 		#if y[i]==0, exit  		#neu t2 = 0 thi ket thuc
	nop 
	addi 	$s0,$s0,1               		#s0=s0 + 1 <-> i=i+1  		#con khong thi +1 cho i
	j 	L1   					#next character  
	nop 
end_of_strcpy:
	 li	$v0, 4
	 la	$a0, x
	 syscall