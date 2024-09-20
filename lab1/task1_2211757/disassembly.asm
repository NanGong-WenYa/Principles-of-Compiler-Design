main:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:       f3 0f 1e fa             endbr64
    1004:       48 83 ec 08             sub    $0x8,%rsp
    1008:       48 8b 05 d1 2f 00 00    mov    0x2fd1(%rip),%rax        # 3fe0 <__gmon_start__@Base>
    100f:       48 85 c0                test   %rax,%rax
    1012:       74 02                   je     1016 <_init+0x16>
    1014:       ff d0                   call   *%rax
    1016:       48 83 c4 08             add    $0x8,%rsp
    101a:       c3                      ret

Disassembly of section .plt:

0000000000001020 <free@plt-0x10>:
    1020:       ff 35 e2 2f 00 00       push   0x2fe2(%rip)        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:       ff 25 e4 2f 00 00       jmp    *0x2fe4(%rip)        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:       0f 1f 40 00             nopl   0x0(%rax)

0000000000001030 <free@plt>:
    1030:       ff 25 e2 2f 00 00       jmp    *0x2fe2(%rip)        # 4018 <free@GLIBC_2.2.5>
    1036:       68 00 00 00 00          push   $0x0
    103b:       e9 e0 ff ff ff          jmp    1020 <_init+0x20>

0000000000001040 <printf@plt>:
    1040:       ff 25 da 2f 00 00       jmp    *0x2fda(%rip)        # 4020 <printf@GLIBC_2.2.5>
    1046:       68 01 00 00 00          push   $0x1
    104b:       e9 d0 ff ff ff          jmp    1020 <_init+0x20>

0000000000001050 <fprintf@plt>:
    1050:       ff 25 d2 2f 00 00       jmp    *0x2fd2(%rip)        # 4028 <fprintf@GLIBC_2.2.5>
    1056:       68 02 00 00 00          push   $0x2
    105b:       e9 c0 ff ff ff          jmp    1020 <_init+0x20>

0000000000001060 <malloc@plt>:
    1060:       ff 25 ca 2f 00 00       jmp    *0x2fca(%rip)        # 4030 <malloc@GLIBC_2.2.5>
    1066:       68 03 00 00 00          push   $0x3
    106b:       e9 b0 ff ff ff          jmp    1020 <_init+0x20>

0000000000001070 <__isoc99_scanf@plt>:
    1070:       ff 25 c2 2f 00 00       jmp    *0x2fc2(%rip)        # 4038 <__isoc99_scanf@GLIBC_2.7>
    1076:       68 04 00 00 00          push   $0x4
    107b:       e9 a0 ff ff ff          jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001080 <__cxa_finalize@plt>:
    1080:       ff 25 6a 2f 00 00       jmp    *0x2f6a(%rip)        # 3ff0 <__cxa_finalize@GLIBC_2.2.5>
    1086:       66 90                   xchg   %ax,%ax

Disassembly of section .text:

0000000000001090 <_start>:
    1090:       f3 0f 1e fa             endbr64
    1094:       31 ed                   xor    %ebp,%ebp
    1096:       49 89 d1                mov    %rdx,%r9
    1099:       5e                      pop    %rsi
    109a:       48 89 e2                mov    %rsp,%rdx
    109d:       48 83 e4 f0             and    $0xfffffffffffffff0,%rsp
    10a1:       50                      push   %rax
    10a2:       54                      push   %rsp
    10a3:       45 31 c0                xor    %r8d,%r8d
    10a6:       31 c9                   xor    %ecx,%ecx
    10a8:       48 8d 3d d1 00 00 00    lea    0xd1(%rip),%rdi        # 1180 <main>
    10af:       ff 15 1b 2f 00 00       call   *0x2f1b(%rip)        # 3fd0 <__libc_start_main@GLIBC_2.34>
    10b5:       f4                      hlt
    10b6:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    10bd:       00 00 00

00000000000010c0 <deregister_tm_clones>:
    10c0:       48 8d 3d 89 2f 00 00    lea    0x2f89(%rip),%rdi        # 4050 <__TMC_END__>
    10c7:       48 8d 05 82 2f 00 00    lea    0x2f82(%rip),%rax        # 4050 <__TMC_END__>
    10ce:       48 39 f8                cmp    %rdi,%rax
    10d1:       74 15                   je     10e8 <deregister_tm_clones+0x28>
    10d3:       48 8b 05 fe 2e 00 00    mov    0x2efe(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable@Base>
    10da:       48 85 c0                test   %rax,%rax
    10dd:       74 09                   je     10e8 <deregister_tm_clones+0x28>
    10df:       ff e0                   jmp    *%rax
    10e1:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)
    10e8:       c3                      ret
    10e9:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

00000000000010f0 <register_tm_clones>:
    10f0:       48 8d 3d 59 2f 00 00    lea    0x2f59(%rip),%rdi        # 4050 <__TMC_END__>
    10f7:       48 8d 35 52 2f 00 00    lea    0x2f52(%rip),%rsi        # 4050 <__TMC_END__>
    10fe:       48 29 fe                sub    %rdi,%rsi
    1101:       48 89 f0                mov    %rsi,%rax
    1104:       48 c1 ee 3f             shr    $0x3f,%rsi
    1108:       48 c1 f8 03             sar    $0x3,%rax
    110c:       48 01 c6                add    %rax,%rsi
    110f:       48 d1 fe                sar    %rsi
    1112:       74 14                   je     1128 <register_tm_clones+0x38>
    1114:       48 8b 05 cd 2e 00 00    mov    0x2ecd(%rip),%rax        # 3fe8 <_ITM_registerTMCloneTable@Base>
    111b:       48 85 c0                test   %rax,%rax
    111e:       74 08                   je     1128 <register_tm_clones+0x38>
    1120:       ff e0                   jmp    *%rax
    1122:       66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)
    1128:       c3                      ret
    1129:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000001130 <__do_global_dtors_aux>:
    1130:       f3 0f 1e fa             endbr64
    1134:       80 3d 15 2f 00 00 00    cmpb   $0x0,0x2f15(%rip)        # 4050 <__TMC_END__>
    113b:       75 2b                   jne    1168 <__do_global_dtors_aux+0x38>
    113d:       55                      push   %rbp
    113e:       48 83 3d aa 2e 00 00    cmpq   $0x0,0x2eaa(%rip)        # 3ff0 <__cxa_finalize@GLIBC_2.2.5>
    1145:       00
    1146:       48 89 e5                mov    %rsp,%rbp
    1149:       74 0c                   je     1157 <__do_global_dtors_aux+0x27>
    114b:       48 8b 3d f6 2e 00 00    mov    0x2ef6(%rip),%rdi        # 4048 <__dso_handle>
    1152:       e8 29 ff ff ff          call   1080 <__cxa_finalize@plt>
    1157:       e8 64 ff ff ff          call   10c0 <deregister_tm_clones>
    115c:       c6 05 ed 2e 00 00 01    movb   $0x1,0x2eed(%rip)        # 4050 <__TMC_END__>
    1163:       5d                      pop    %rbp
    1164:       c3                      ret
    1165:       0f 1f 00                nopl   (%rax)
    1168:       c3                      ret
    1169:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000001170 <frame_dummy>:
    1170:       f3 0f 1e fa             endbr64
    1174:       e9 77 ff ff ff          jmp    10f0 <register_tm_clones>
    1179:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000001180 <main>:
    1180:       55                      push   %rbp
    1181:       48 89 e5                mov    %rsp,%rbp
    1184:       48 83 ec 20             sub    $0x20,%rsp
    1188:       c7 45 e4 00 00 00 00    movl   $0x0,-0x1c(%rbp)
    118f:       48 bf 10 20 00 00 00    movabs $0x2010,%rdi
    1196:       00 00 00
    1199:       48 8d 75 f4             lea    -0xc(%rbp),%rsi
    119d:       b0 00                   mov    $0x0,%al
    119f:       e8 cc fe ff ff          call   1070 <__isoc99_scanf@plt>
    11a4:       48 63 7d f4             movslq -0xc(%rbp),%rdi
    11a8:       48 c1 e7 03             shl    $0x3,%rdi
    11ac:       e8 af fe ff ff          call   1060 <malloc@plt>
    11b1:       48 89 45 e8             mov    %rax,-0x18(%rbp)
    11b5:       48 83 7d e8 00          cmpq   $0x0,-0x18(%rbp)
    11ba:       75 27                   jne    11e3 <main+0x63>
    11bc:       48 8b 05 35 2e 00 00    mov    0x2e35(%rip),%rax        # 3ff8 <stderr@GLIBC_2.2.5>
    11c3:       48 8b 38                mov    (%rax),%rdi
    11c6:       48 be 13 20 00 00 00    movabs $0x2013,%rsi
    11cd:       00 00 00
    11d0:       b0 00                   mov    $0x0,%al
    11d2:       e8 79 fe ff ff          call   1050 <fprintf@plt>
    11d7:       c7 45 e4 01 00 00 00    movl   $0x1,-0x1c(%rbp)
    11de:       e9 b5 00 00 00          jmp    1298 <main+0x118>
    11e3:       48 8b 45 e8             mov    -0x18(%rbp),%rax
    11e7:       0f 57 c0                xorps  %xmm0,%xmm0
    11ea:       f2 0f 11 00             movsd  %xmm0,(%rax)
    11ee:       83 7d f4 01             cmpl   $0x1,-0xc(%rbp)
    11f2:       7e 11                   jle    1205 <main+0x85>
    11f4:       48 8b 45 e8             mov    -0x18(%rbp),%rax
    11f8:       f2 0f 10 05 08 0e 00    movsd  0xe08(%rip),%xmm0        # 2008 <_IO_stdin_used+0x8>
    11ff:       00
    1200:       f2 0f 11 40 08          movsd  %xmm0,0x8(%rax)
    1205:       c7 45 fc 02 00 00 00    movl   $0x2,-0x4(%rbp)
    120c:       8b 45 fc                mov    -0x4(%rbp),%eax
    120f:       3b 45 f4                cmp    -0xc(%rbp),%eax
    1212:       7d 3c                   jge    1250 <main+0xd0>
    1214:       48 8b 45 e8             mov    -0x18(%rbp),%rax
    1218:       8b 4d fc                mov    -0x4(%rbp),%ecx
    121b:       83 e9 01                sub    $0x1,%ecx
    121e:       48 63 c9                movslq %ecx,%rcx
    1221:       f2 0f 10 04 c8          movsd  (%rax,%rcx,8),%xmm0
    1226:       48 8b 45 e8             mov    -0x18(%rbp),%rax
    122a:       8b 4d fc                mov    -0x4(%rbp),%ecx
    122d:       83 e9 02                sub    $0x2,%ecx
    1230:       48 63 c9                movslq %ecx,%rcx
    1233:       f2 0f 58 04 c8          addsd  (%rax,%rcx,8),%xmm0
    1238:       48 8b 45 e8             mov    -0x18(%rbp),%rax
    123c:       48 63 4d fc             movslq -0x4(%rbp),%rcx
    1240:       f2 0f 11 04 c8          movsd  %xmm0,(%rax,%rcx,8)
    1245:       8b 45 fc                mov    -0x4(%rbp),%eax
    1248:       83 c0 01                add    $0x1,%eax
    124b:       89 45 fc                mov    %eax,-0x4(%rbp)
    124e:       eb bc                   jmp    120c <main+0x8c>
    1250:       c7 45 f8 00 00 00 00    movl   $0x0,-0x8(%rbp)
    1257:       8b 45 f8                mov    -0x8(%rbp),%eax
    125a:       3b 45 f4                cmp    -0xc(%rbp),%eax
    125d:       7d 29                   jge    1288 <main+0x108>
    125f:       48 8b 45 e8             mov    -0x18(%rbp),%rax
    1263:       48 63 4d f8             movslq -0x8(%rbp),%rcx
    1267:       f2 0f 10 04 c8          movsd  (%rax,%rcx,8),%xmm0
    126c:       48 bf 2d 20 00 00 00    movabs $0x202d,%rdi
    1273:       00 00 00
    1276:       b0 01                   mov    $0x1,%al
    1278:       e8 c3 fd ff ff          call   1040 <printf@plt>
    127d:       8b 45 f8                mov    -0x8(%rbp),%eax
    1280:       83 c0 01                add    $0x1,%eax
    1283:       89 45 f8                mov    %eax,-0x8(%rbp)
    1286:       eb cf                   jmp    1257 <main+0xd7>
    1288:       48 8b 7d e8             mov    -0x18(%rbp),%rdi
    128c:       e8 9f fd ff ff          call   1030 <free@plt>
    1291:       c7 45 e4 00 00 00 00    movl   $0x0,-0x1c(%rbp)
    1298:       8b 45 e4                mov    -0x1c(%rbp),%eax
    129b:       48 83 c4 20             add    $0x20,%rsp
    129f:       5d                      pop    %rbp
    12a0:       c3                      ret

Disassembly of section .fini:

00000000000012a4 <_fini>:
    12a4:       f3 0f 1e fa             endbr64
    12a8:       48 83 ec 08             sub    $0x8,%rsp
    12ac:       48 83 c4 08             add    $0x8,%rsp
    12b0:       c3                      ret