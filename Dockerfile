FROM mcr.microsoft.com/dotnet/sdk:5.0

RUN apt-get update
RUN apt-get install -y build-essential nodejs
