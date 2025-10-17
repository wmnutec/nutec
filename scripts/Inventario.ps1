
Clear-Host
$patrimonio = Read-Host -Prompt "Por favor, digite o numero de Patrimonio/Tombamento desta maquina e pressione Enter"

Write-Host "Coletando informacoes do sistema (v5)..." -ForegroundColor Yellow


$computador = Get-CimInstance -ClassName Win32_ComputerSystem
$bios = Get-CimInstance -ClassName Win32_BIOS
$os = Get-CimInstance -ClassName Win32_OperatingSystem
$cpu = Get-CimInstance -ClassName Win32_Processor
$discosLogicos = Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }
$discosFisicos = Get-PhysicalDisk | Where-Object { $_.MediaType -ne 'Unspecified' }
$ips = Get-NetIPAddress -AddressFamily IPv4 -InterfaceIndex (Get-NetConnectionProfile).InterfaceIndex

$ipFormatado = ($ips.IPAddress | Out-String -Stream).Trim() -replace "`n", " | "
$cpuFormatado = ($cpu.Name -replace '\(R\)|\(TM\)|CPU @ .*GHz', '' -replace '\s+', ' ').Trim()
$ramFormatado = [math]::Round($computador.TotalPhysicalMemory / 1GB)
$particoesFormatado = $discosLogicos | ForEach-Object { "$($_.DeviceID) $([math]::Round($_.Size / 1GB, 2)) GB" } | Out-String -Stream
$particoesFormatado = ($particoesFormatado.Trim() -replace "`n", " | ").Trim()
$tipoDiscoFormatado = $discosFisicos | ForEach-Object { "$($_.FriendlyName) ($($_.MediaType))" } | Out-String -Stream
$tipoDiscoFormatado = ($tipoDiscoFormatado.Trim() -replace "`n", " | ").Trim()
$soFormatado = $os.Caption -replace 'Microsoft Windows', 'Win'


$inventario = [PSCustomObject]@{
    "Patrimonio"        = $patrimonio
    "Nome_Computador"   = $env:COMPUTERNAME
    "Usuario_Logado"    = $env:USERNAME
    "Endereco_IP"       = $ipFormatado
    "Fabricante"        = $computador.Manufacturer
    "Modelo"            = $computador.Model
    "Numero_Serie_BIOS" = $bios.SerialNumber
    "Processador"       = $cpuFormatado
    "Memoria_RAM_GB"    = $ramFormatado
    "Sistema_Op"        = $soFormatado
    "Tipo_Disco"        = $tipoDiscoFormatado
    "Particoes"         = $particoesFormatado
}


try {
    $excel = New-Object -ComObject Excel.Application -ErrorAction Stop
    $excel.Visible = $false
    $workbook = $excel.Workbooks.Add()
    $sheet = $workbook.Worksheets.Item(1)
    
  
    $headers = $inventario.psobject.Properties.Name
    for ($i = 1; $i -le $headers.Count; $i++) { $sheet.Cells.Item(1, $i) = $headers[$i - 1] }
    $headerRange = $sheet.Range("A1", "$([char](64 + $headers.Count))1")
    $headerRange.Font.Bold = $true
    $headerRange.Interior.ColorIndex = 23
    $headerRange.Font.ColorIndex = 2
    
  
    $data = $inventario.psobject.Properties.Value
    for ($i = 1; $i -le $data.Count; $i++) { $sheet.Cells.Item(2, $i) = $data[$i - 1] }
    
    $sheet.Columns.AutoFit() | Out-Null
    
    
    $caminhoDoArquivo = [System.Environment]::GetFolderPath('Desktop') + "\$($env:COMPUTERNAME).xlsx"
    $workbook.SaveAs($caminhoDoArquivo)
    $workbook.Close()
    $excel.Quit()
    
   
    [System.Runtime.InteropServices.Marshal]::ReleaseComObject($sheet) | Out-Null
    [System.Runtime.InteropServices.Marshal]::ReleaseComObject($workbook) | Out-Null
    [System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel) | Out-Null
    
    Write-Host "--------------------------------------------------------" -ForegroundColor Green
    Write-Host "Planilha Excel formatada salva com sucesso!" -ForegroundColor Green
    Write-Host "Nome do arquivo: $($env:COMPUTERNAME).xlsx" -ForegroundColor Cyan
}
catch {
    Write-Host "--------------------------------------------------------" -ForegroundColor Yellow
    Write-Host "AVISO: Nao foi possivel criar o arquivo Excel." -ForegroundColor Yellow
    Write-Host "Motivo provavel: O Microsoft Excel nao esta instalado nesta maquina." -ForegroundColor Yellow
    Write-Host "Criando um arquivo .CSV compativel como alternativa." -ForegroundColor Yellow
    
    
    $caminhoDoArquivo = [System.Environment]::GetFolderPath('Desktop') + "\$($env:COMPUTERNAME).csv"
    $inventario | Export-Csv -Path $caminhoDoArquivo -NoTypeInformation -Encoding UTF8 -Delimiter ';'
    
    Write-Host "--------------------------------------------------------" -ForegroundColor Green
    Write-Host "Arquivo CSV salvo com sucesso!" -ForegroundColor Green
    Write-Host "Nome do arquivo: $($env:COMPUTERNAME).csv" -ForegroundColor Cyan
}

Start-Sleep -Seconds 7