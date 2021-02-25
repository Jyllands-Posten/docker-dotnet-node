FROM mcr.microsoft.com/dotnet/sdk:5.0

# Tell Docker that I want to use PowerShell to run my commands
SHELL ["powershell"]

# Install Scoop (Windows Package Manager) from Scoop.sh (This command is on their homepage)
RUN iwr -useb get.scoop.sh | iex

# Tell Scoop to download and install NodeJS
RUN scoop install nodejs

# Set a working directory for us on the root drive
WORKDIR /app

# DONE
RUN exit
