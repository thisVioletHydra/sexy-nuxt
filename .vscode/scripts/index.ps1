$gitLog = git log --stat --graph -1
$gitStatus = git status -s
$gitEmpty = "$gitStatus".Length
$time = $(Get-Date -UFormat "[%m/%d/%Y] - %R")

function Write-ColorizedMSG {
  param(
    [String]$str,
    [Parameter(Mandatory = $false)]
    [ValidateSet("INFO", "DONE", "WARN")]
    [string]$MSGtype = "INFO",
    [Parameter(Mandatory = $false)]
    [System.Object]$obj = $null
  )
  switch ($MSGtype) {
    'INFO' { $Color = "Cyan" }
    'DONE' { $Color = "Green" }
    'WARN' { $Color = "Yellow" }
    default {
      Write-Host "`r`nImpossible MSGType selected"
      $Color = "Magenta"
    }
  }
  Write-Host "`r`n[$($time)][$MSGtype]: $str" -ForegroundColor $Color
  $obj | Out-Host
}

function Push-GitAutoCommit {
  git commit -am "⭐️$($time) Autocommit"
  git push
} 

Write-ColorizedMSG -str "🙄 Last Commit" -MSGtype 'INFO' -obj $gitLog
Write-ColorizedMSG -str "🤔 New Files" -MSGtype 'INFO' -obj $gitStatus

if ($gitEmpty -gt 0) {
  Write-ColorizedMSG -str "✈️ Uploading files" -MSGtype 'INFO'
  try {
    Push-GitAutoCommit
    Write-ColorizedMSG -str "🟢 SUCCESS! `r`n" -MSGtype 'DONE'
  }
  catch {
    Clear-Host
    Write-ColorizedMSG -str "🔴 Failed to Upload`r`n" -MSGtype 'WARN'
  }
}
else { 
  Clear-Host
  Write-ColorizedMSG -str "🔴 Nothing happened`r`n" -MSGtype 'WARN'
}
Exit