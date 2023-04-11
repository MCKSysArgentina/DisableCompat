@echo off
echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    del /f /q "%SystemRoot%\System32\CompatTelRunner.exe.bak"
    takeown /f "%SystemRoot%\System32\CompatTelRunner.exe"
    cacls "%SystemRoot%\System32\CompatTelRunner.exe" /T /E /P %username%:F
    ren "%SystemRoot%\System32\CompatTelRunner.exe" CompatTelRunner.exe.bak
) else (
    echo Error: Administrative permissions required.
)
pause > nul
