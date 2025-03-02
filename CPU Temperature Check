# PowerShell script to check CPU temperature (works on some Windows systems)
$cpuTemperature = Get-WmiObject -Namespace "root\wmi" -Class "MSAcpi_TemperatureProbe"

if ($cpuTemperature) {
    $cpuTempCelsius = $cpuTemperature.CurrentTemperature
    # Convert the value to Celsius (the WMI result is in tenths of Kelvin)
    $cpuTempCelsius = ($cpuTempCelsius - 2732) / 10
    Write-Host "CPU Temperature: $cpuTempCelsius°C"
} else {
    Write-Host "Unable to retrieve CPU temperature. This might be due to missing WMI classes or drivers."
}
