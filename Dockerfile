#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch-slim AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.1-stretch AS build
WORKDIR /src
COPY ["DevSecOps.csproj", ""]
RUN dotnet restore "./DevSecOps.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "DevSecOps.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DevSecOps.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DevSecOps.dll"]