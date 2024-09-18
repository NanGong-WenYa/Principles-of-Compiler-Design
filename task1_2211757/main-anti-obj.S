
fib.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 20          	sub    $0x20,%rsp
   8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
   f:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
  16:	00 00 00 
  19:	48 8d 75 f4          	lea    -0xc(%rbp),%rsi
  1d:	b0 00                	mov    $0x0,%al
  1f:	e8 00 00 00 00       	call   24 <main+0x24>
  24:	48 63 7d f4          	movslq -0xc(%rbp),%rdi
  28:	48 c1 e7 03          	shl    $0x3,%rdi
  2c:	e8 00 00 00 00       	call   31 <main+0x31>
  31:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  35:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  3a:	75 27                	jne    63 <main+0x63>
  3c:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 43 <main+0x43>
  43:	48 8b 38             	mov    (%rax),%rdi
  46:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
  4d:	00 00 00 
  50:	b0 00                	mov    $0x0,%al
  52:	e8 00 00 00 00       	call   57 <main+0x57>
  57:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
  5e:	e9 b5 00 00 00       	jmp    118 <main+0x118>
  63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  67:	0f 57 c0             	xorps  %xmm0,%xmm0
  6a:	f2 0f 11 00          	movsd  %xmm0,(%rax)
  6e:	83 7d f4 01          	cmpl   $0x1,-0xc(%rbp)
  72:	7e 11                	jle    85 <main+0x85>
  74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  78:	f2 0f 10 05 00 00 00 	movsd  0x0(%rip),%xmm0        # 80 <main+0x80>
  7f:	00 
  80:	f2 0f 11 40 08       	movsd  %xmm0,0x8(%rax)
  85:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%rbp)
  8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8f:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  92:	7d 3c                	jge    d0 <main+0xd0>
  94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  98:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  9b:	83 e9 01             	sub    $0x1,%ecx
  9e:	48 63 c9             	movslq %ecx,%rcx
  a1:	f2 0f 10 04 c8       	movsd  (%rax,%rcx,8),%xmm0
  a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  aa:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  ad:	83 e9 02             	sub    $0x2,%ecx
  b0:	48 63 c9             	movslq %ecx,%rcx
  b3:	f2 0f 58 04 c8       	addsd  (%rax,%rcx,8),%xmm0
  b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  bc:	48 63 4d fc          	movslq -0x4(%rbp),%rcx
  c0:	f2 0f 11 04 c8       	movsd  %xmm0,(%rax,%rcx,8)
  c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  c8:	83 c0 01             	add    $0x1,%eax
  cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  ce:	eb bc                	jmp    8c <main+0x8c>
  d0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  d7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  da:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  dd:	7d 29                	jge    108 <main+0x108>
  df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  e3:	48 63 4d f8          	movslq -0x8(%rbp),%rcx
  e7:	f2 0f 10 04 c8       	movsd  (%rax,%rcx,8),%xmm0
  ec:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
  f3:	00 00 00 
  f6:	b0 01                	mov    $0x1,%al
  f8:	e8 00 00 00 00       	call   fd <main+0xfd>
  fd:	8b 45 f8             	mov    -0x8(%rbp),%eax
 100:	83 c0 01             	add    $0x1,%eax
 103:	89 45 f8             	mov    %eax,-0x8(%rbp)
 106:	eb cf                	jmp    d7 <main+0xd7>
 108:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
 10c:	e8 00 00 00 00       	call   111 <main+0x111>
 111:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
 118:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 11b:	48 83 c4 20          	add    $0x20,%rsp
 11f:	5d                   	pop    %rbp
 120:	c3                   	ret    
