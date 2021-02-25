FROM mcr.microsoft.com/dotnet/sdk:5.0-nanoserver-1809

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 14.16.0
ENV NODE_SHA256 D9243C9D02F5E4801B8B3AB848F45CE0DA2882B5FFF448191548CA49AF434066

RUN powershell -Command wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing; if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 111}; Start-Process -FilePath msiexec -ArgumentList /q, /i, node.msi -Wait; Remove-Item -Path node.msi
