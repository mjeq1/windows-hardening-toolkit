<#
.SYNOPSIS
    Windows Privacy & Hardening Script
.DESCRIPTION
    Disables common telemetry services and hardens privacy settings 
    after creating a system restore point.
.AUTHOR
    Jeremias Quintero (mjeq)
#>

# --- VERIFICACIÓN DE PERMISOS ---
# El script se detiene si no se ejecuta como Administrador
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "ERROR: Este script requiere privilegios de Administrador."
    Write-Warning "Por favor, ejecuta PowerShell como Administrador."
    Break
}

Write-Host "--- INICIANDO PROTOCOLO DE HARDENING ---" -ForegroundColor Cyan

# --- PASO 1: SEGURIDAD (BACKUP) ---
# Intentamos crear un punto de restauración antes de tocar nada.
Try {
    Write-Host "[-] Creando Punto de Restauración del Sistema..."
    Checkpoint-Computer -Description "Pre-Hardening-mjeq" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop
    Write-Host "[OK] Backup creado exitosamente." -ForegroundColor Green
}
Catch {
    Write-Error "FALLO CRÍTICO: No se pudo crear el punto de restauración."
    Write-Error "El script se detendrá por seguridad."
    Break
}

# --- PASO 2: PRIVACIDAD (TELEMETRÍA) ---
# Modificamos el registro para limitar el envío de datos a Microsoft.
Write-Host "[-] Configurando políticas de Telemetría..."
$telemetryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

# Si la ruta en el registro no existe, la creamos
if (-not (Test-Path $telemetryPath)) {
    New-Item -Path $telemetryPath -Force | Out-Null
}

# AllowTelemetry: 0 = Security (Minimal data)
Set-ItemProperty -Path $telemetryPath -Name "AllowTelemetry" -Value 0
Write-Host "[OK] Telemetría restringida a nivel 'Security'." -ForegroundColor Green

# --- PASO 3: OPTIMIZACIÓN (SERVICIOS) ---
# Deshabilitamos servicios de rastreo conocidos.
$services = @(
    "DiagTrack",       # Connected User Experiences and Telemetry
    "dmwappushservice" # WAP Push Message Routing Service
)

foreach ($service in $services) {
    if (Get-Service $service -ErrorAction SilentlyContinue) {
        Write-Host "[-] Deshabilitando servicio: $service"
        Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
        Set-Service -Name $service -StartupType Disabled
    } else {
        Write-Host "[info] El servicio $service ya no está activo o no existe." -ForegroundColor Gray
    }
}

Write-Host "--- HARDENING COMPLETADO EXITOSAMENTE ---" -ForegroundColor Cyan
