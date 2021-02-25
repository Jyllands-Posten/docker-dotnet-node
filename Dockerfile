FROM mcr.microsoft.com/dotnet/sdk:5.0

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 14.16.0
ENV NODE_SHA256 d9243c9d02f5e4801b8b3ab848f45ce0da2882b5fff448191548ca49af434066

RUN powershell -Command \
    wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing ; \
    if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Start-Process -FilePath msiexec -ArgumentList /q, /i, node.msi -Wait ; \
    Remove-Item -Path node.msi
