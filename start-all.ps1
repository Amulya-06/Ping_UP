# ChatApp Startup Script
# This script starts all three components of the ChatApp

Write-Host "Starting ChatApp..." -ForegroundColor Green
Write-Host ""

# Check if MongoDB is running
Write-Host "Checking MongoDB connection..." -ForegroundColor Yellow
try {
    $mongoTest = Test-NetConnection -ComputerName localhost -Port 27017 -WarningAction SilentlyContinue
    if ($mongoTest.TcpTestSucceeded) {
        Write-Host "✓ MongoDB is running" -ForegroundColor Green
    } else {
        Write-Host "⚠ MongoDB might not be running. Please start MongoDB first." -ForegroundColor Yellow
        Write-Host "  Run: mongod" -ForegroundColor Yellow
    }
} catch {
    Write-Host "⚠ Could not verify MongoDB status" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Starting servers in separate windows..." -ForegroundColor Cyan
Write-Host ""

# Start Server
Write-Host "Starting Server (Backend API) on port 5000..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\server'; npm start"

# Wait a moment
Start-Sleep -Seconds 2

# Start Socket Server
Write-Host "Starting Socket Server on port 3000..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\socket'; npm start"

# Wait a moment
Start-Sleep -Seconds 2

# Start Client
Write-Host "Starting Client (Frontend) on port 5173..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\client'; npm run dev"

Write-Host ""
Write-Host "✓ All servers are starting!" -ForegroundColor Green
Write-Host ""
Write-Host "The application will be available at: http://localhost:5173" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to exit this script (servers will continue running)..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
