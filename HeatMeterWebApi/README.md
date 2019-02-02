# Heat Meter Web Api
This is the basic template DotnetCore 2.2 WebApi template

## Docker

### DockerFile Documentation
The document DockerFile.MD in this folder contains the explanation of every line in the DockerFile in this example.

### Build only the dockerfile image:
Open the Console Window and navigate to the path where its the docker file and build the docker file
> C:\DockerDotnetCoreJmeter\HeatMeterWebApi> __docker build --tag heatmeterwebapi .__

### Run Docker file
Run container of the image heatMeterWebApi :

> C:\DockerDotnetCoreJmeter\HeatMeterWebApi> __docker run --name heatmeterwebapi --rm -it -p 8000:5106 heatwebapi__