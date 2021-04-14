@echo off
:: Unencoded powershell:
:: $index = (Get-Content options.json | Select-Object -Index ((Get-Content options.json).Length - 4))
:: (Get-Content options.json).Replace('"(",', "").Replace('")",', "").Replace($index, "") | Select-String -NotMatch -pattern '.mkv"', '"--output",', '"--title",' | Out-File options.json -Force -Encoding "UTF8"


set mkvmerge="C:\Program Files\MKVToolNix\mkvmerge.exe"
if not exist "options.json" (
    echo Options file 'options.json' not found. Exiting.
    pause>nul
    exit
)


find "--output" options.json > NUL
if ERRORLEVEL 1 goto NoPS (else goto PS)


:PS
powershell -EncodedCommand CgAkAGkAbgBkAGUAeAAgAD0AIAAoAEcAZQB0AC0AQwBvAG4AdABlAG4AdAAgAG8AcAB0AGkAbwBuAHMALgBqAHMAbwBuACAAfAAgAFMAZQBsAGUAYwB0AC0ATwBiAGoAZQBjAHQAIAAtAEkAbgBkAGUAeAAgACgAKABHAGUAdAAtAEMAbwBuAHQAZQBuAHQAIABvAHAAdABpAG8AbgBzAC4AagBzAG8AbgApAC4ATABlAG4AZwB0AGgAIAAtACAANAApACkACgAKACgARwBlAHQALQBDAG8AbgB0AGUAbgB0ACAAbwBwAHQAaQBvAG4AcwAuAGoAcwBvAG4AKQAuAFIAZQBwAGwAYQBjAGUAKAAnACIAKAAiACwAJwAsACAAIgAiACkALgBSAGUAcABsAGEAYwBlACgAJwAiACkAIgAsACcALAAgACIAIgApAC4AUgBlAHAAbABhAGMAZQAoACQAaQBuAGQAZQB4ACwAIAAiACIAKQAgAHwAIABTAGUAbABlAGMAdAAtAFMAdAByAGkAbgBnACAALQBOAG8AdABNAGEAdABjAGgAIAAtAHAAYQB0AHQAZQByAG4AIAAnAC4AbQBrAHYAIgAnACwAIAAnACIALQAtAG8AdQB0AHAAdQB0ACIALAAnACwAIAAnACIALQAtAHQAaQB0AGwAZQAiACwAJwAgAHwAIABPAHUAdAAtAEYAaQBsAGUAIABvAHAAdABpAG8AbgBzAC4AagBzAG8AbgAgAC0ARgBvAHIAYwBlACAALQBFAG4AYwBvAGQAaQBuAGcAIAAiAFUAVABGADgAIgAKAA==


:NoPS
if not exist "mkvmerge_out" (mkdir "mkvmerge_out")
for %%f in (*.mkv) do %mkvmerge% @options.json -o "mkvmerge_out/%%f" "%%f"
echo.
echo ============================
echo Done. Press any key to exit.
pause>nul
exit

