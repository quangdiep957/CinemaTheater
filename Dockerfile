#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["AdminCinemaCore/AdminCinemaCore.csproj", "AdminCinemaCore/"]
COPY ["AdminCinemaCommon/AdminCinemaCommon.csproj", "AdminCinemaCommon/"]
COPY ["AdminCinemaBLL/AdminCinemaBLL.csproj", "AdminCinemaBLL/"]
COPY ["AdminCinemaDAL/AdminCinemaDAL.csproj", "AdminCinemaDAL/"]
RUN dotnet restore "AdminCinemaCore/AdminCinemaCore.csproj"
COPY . .
WORKDIR "/src/AdminCinemaCore"
RUN dotnet build "AdminCinemaCore.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "AdminCinemaCore.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AdminCinemaCore.dll"]
