# Uninstall unused Windows Apps
```powershell
'Dev Home', 'Game Bar', 'Game Speech Window', 'Microsoft Bing', 'OneDrive', 'Xbox Identity Provider' |
  ForEach-Object { winget uninstall --name $_ }
```