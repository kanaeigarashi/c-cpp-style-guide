> setup-hooks.bat
> 
> clang-tidy test.c

## memo

cmakeでcompile_commands.jsonが生成されればcompile_commands.jsonは不要。
ただしCMAKE_EXPORT_COMPILE_COMMANDSオプションはMakefileとNinjaでのみ実装されている。
暫定的な対応として手動でjsonを作成する。