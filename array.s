;;For inserting 'words' into an array you need to iterate by 8
;;The register r29 holds this iterator
	.data
top:	.word 0
N:		.word 101
array:	.space 4096

	.text
main:
	ld r2,N(r0)			;load 101 into r2
	daddi r30,r0,2		;add 2 into r30
addToArray:
	beq r30,r2,done		;if r30 reaches 101 jump to done:
	sd r30,base(r29)	;store value of r30 into array at index r29
	daddi r29,r29,8		;iterate through array
	daddi r30,r30,1		;incremement so we know when we've reached the end
	j addToArray		;jump to addToArray
done:
	halt				;stop program