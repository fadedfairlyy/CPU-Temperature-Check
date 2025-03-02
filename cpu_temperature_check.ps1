$cpuTemperature = Get-WmiObject -Namespace "root\wmi" -Class "MSAcpi_TemperatureProbe"

if ($cpuTemperature -and $cpuTemperature.CurrentTemperature) {
    # Convert tenths of Kelvin to Celsius
    $cpuTempCelsius = ($cpuTemperature.CurrentTemperature - 2732) / 10
    Write-Host "CPU Temperature: $cpuTempCelsius°C"
} else {
    Write-Host "Unable to retrieve CPU temperature. Your system might not support WMI temperature monitoring."
}

# Keep the window open
Write-Host "Press Enter to exit..."
$null = Read-Host
