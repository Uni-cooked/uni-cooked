@echo off
setlocal enabledelayedexpansion

:: Imposta i percorsi delle cartelle
set "cartella_sorgente=img_raw"
set "cartella_destinazione=img"

if exist "%cartella_destinazione%" (
    rd /s /q "%cartella_destinazione%"
)

:: Verifica l'esistenza delle cartelle
if not exist "%cartella_sorgente%" (
    echo La cartella sorgente non esiste.
    pause
    exit /b 1
)

robocopy "%cartella_sorgente%" "%cartella_destinazione%" /E
echo Cartella di destinazione creata: "%cartella_destinazione%"

:: Percorso del convertitore WebP (ad esempio, cwebp.exe)
set "convertitore=cwebp"
set "quality= -q 100"

:: Itera su tutte le cartelle e i file nella cartella sorgente
for /R "%cartella_destinazione%" %%a in ("*") do (
    @REM echo "%%~da%%~pa%%~na"
    "%convertitore%" "%quality%" "%%a" -o "%%~da%%~pa%%~na.webp"
    del "%%a"
)

echo Conversione completata.
pause