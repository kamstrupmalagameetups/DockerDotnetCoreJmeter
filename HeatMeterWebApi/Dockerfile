FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["HeatMeterWebApi/HeatMeterWebApi.csproj", "HeatMeterWebApi/"]
RUN dotnet restore "HeatMeterWebApi/HeatMeterWebApi.csproj"

COPY . .
WORKDIR /src/HeatMeterWebApi
RUN dotnet build "HeatMeterWebApi.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "HeatMeterWebApi.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .


ENTRYPOINT ["dotnet", "HeatMeterWebApi.dll"]