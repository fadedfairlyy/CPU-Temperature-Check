# Get CPU temperature using WMI
$cpuTemperature = Get-WmiObject -Namespace "root\wmi" -Class "MSAcpi_TemperatureProbe"

if ($cpuTemperature -and $cpuTemperature.CurrentTemperature) {
    # Convert WMI's tenths of Kelvin to Celsius
    $cpuTempC = ($cpuTemperature.CurrentTemperature - 2732) / 10

    # Convert to Fahrenheit and Kelvin
    $cpuTempF = ($cpuTempC * 9/5) + 32
    $cpuTempK = $cpuTempC + 273.15

    Write-Host "CPU Temperature:"
    Write-Host "  - $cpuTempC°C"
    Write-Host "  - $cpuTempF°F"
    Write-Host "  - $cpuTempK K"
} else {
    Write-Host "Unable to retrieve CPU temperature. Your system may not support WMI temperature monitoring."
}

# Keep window open
Write-Host "`nPress Enter to exit..."
$null = Read-Host
