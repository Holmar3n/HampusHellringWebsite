# Byggfas: Använd en .NET SDK-bild för att bygga projektet
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Kopiera projektfiler och återställ beroenden
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o out

# Körningsfas: Använd ASP.NET Core runtime-bild
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Kopiera den byggda appen från build-stegen
COPY --from=build /app/out ./

# Exponera porten och starta applikationen
EXPOSE 80
ENTRYPOINT ["dotnet", "HampusHellringWebsite.dll"]
