void CPUID(unsigned long * a, unsigned long * b, unsigned long * c, unsigned long * d)
{
	__asm
	{
		mov	eax, DWORD PTR [a]
		mov	eax, DWORD PTR [eax]
		cpuid
		push	eax
		mov	eax, DWORD PTR [b]
		mov	DWORD PTR [eax], ebx
		mov	eax, DWORD PTR [c]
		mov	DWORD PTR [eax], ecx
		mov	eax, DWORD PTR [d]
		mov	DWORD PTR [eax], edx
		pop	eax
		mov	edx, DWORD PTR [a]
		mov	DWORD PTR [edx], eax
	}
}