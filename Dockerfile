# Använd officiell ASP.NET Core runtime som bas
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

# Kopiera alla filer till containern
COPY . .

# Bygg projektet
RUN dotnet publish -c Release -o out

# Exponera porten
EXPOSE 80

# Starta applikationen
CMD ["dotnet", "out/HampusHellringWebsite.dll"]
