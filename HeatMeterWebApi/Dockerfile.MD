
# DockerFile documentation
A DockerFile is just build **instructions** to build the image and in this document we're going to describe line by line what is done in this example of Dockerfile .

When it's execute the **docker build**  it will run every line of the DockerFile as a command as part of the same "script".

# DockerFile line by line 
The below sentence define the base image **re-using** microsoft/dotnet:2.2  image with only the  **AspNetCore** **RUNTIME** image

> FROM microsoft/dotnet:2.2-aspnetcore-runtime AS **base**  

Create and set as **working directory** inside of the container **/app**
> WORKDIR /app  

Add a **new layer** using **DotNet sdk** image to **compile** the App inside of the container 
> FROM microsoft/dotnet:2.2-sdk AS **build**
> WORKDIR /src

Copy just the **HeatMeterWebApi.csproj** from the local machine **to the container image**
> COPY ["HeatMeterWebApi/**HeatMeterWebApi.csproj**","HeatMeterWebApi/" 

**Restore** Dotnet **packages** necessary of the csproj 
> RUN dotnet restore "HeatMeterWebApi/HeatMeterWebApi.csproj"
 
**Copy** the **all** the source code from the local machine **to the container** image path **/src/HeatMeterWebApi**
> COPY . .
> WORKDIR /src/HeatMeterWebApi

 **Build** the csproj and **save** the the **dlls in /app**
> RUN dotnet build "HeatMeterWebApi.csproj" -c Release -o /app

Create a **new layer "publish"** re-using the layer of the "build"
> FROM build AS **publish**
 
Create a release **publish** the package **in /app**
> RUN dotnet **publish** "HeatMeterWebApi.csproj" -c **Release** -o /app

Create the **"final"** container image **using the "base" layer**
> FROM **base** AS **final**
>  WORKDIR /app

**Copy** files from the "**publish**" image **layer** in /app  to build this final container image
> COPY --from=publish /app .

Set as start point of the container the WebApi HeatMeterWebApi.dll
> ENTRYPOINT ["dotnet", "HeatMeterWebApi.dll"]