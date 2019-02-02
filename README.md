# Docker with .NET Core and  JMeter
With this example we'll share how can we build a sample .NET Core  application running in Docker and test it using Apache JMeter running in Docker.  

In Kamstrup we are working with Docker, .NET Core and JMeter and we'll share many tips from our professional experience.

> This code accompanies a [Meetup](https://www.meetup.com/Kamstrup-Malaga/events/256775155/) session for learning and is not intended for the wild! 
  
Here bellow we can read a quick overview of the content and in each folder there is a README.md explaining more details 

# Prerequisites

- Visual Studio
- [Docker desktop](https://www.docker.com/products/docker-desktop)

# HeatMeterWebApi
In this example we are going to show use the basic DotnetCore WebApi Template application.

## Code Structure
The sample application used is the basic DotNetCore WebApi template and we'll just use the bellow Values Controller.

	HeatMeterWebApi.sln
		HeatMeterWebApi.csproj
			Controllers
				ValuesController.cs


# Containerized .NET Core 2.2 Web API
This tutorial we'll show how to  run a .Net Core Heat Meter Web Api AspNetCore application in Docker.

## Docker Files Code Structure
Here we can see the code structure related with Docker 

	HeatMeterWebApi.sln
		HeatMeterWebApi.csproj
		DockerFile
	Docker-compose.yml
	.dockerignore
		
## Instructions 

You can either download the Docker image from [our public Docker Hub repository](https://hub.docker.com/r/kamstrupmalaga/heatmeterwebapi)

	docker pull kamstrupmalaga/heatmeterwebapi

...or building it locally after cloning the Git repository in the next step.

### Build the Docker image

Open a console window and navigate to the path where the `Dockerfile` is.

	docker build --tag heatmeterwebapi .

Verify that the image has been built successfully by:

	docker images

Output:

	REPOSITORY	TAG	IMAGE ID	CREATED	 	SIZE
	heatmeterwebapi	latest	0f0c49baaca2	5 minutes ago	260MB	

### Push the Docker image to our private Docker Hub repository

	docker tag 0f0c49baaca2 kamstrupmalaga/heatmeterwebapi:latest
	docker login --username dockerhub_username --password ******
	docker push kamstrupmalaga/heatmeterwebapi:latest

### Run a Docker container from the previous image
	docker run --name heatmeterwebapi --rm -it -p 8000:80 heatmeterwebapi

Output:

	...
	Content root path: /app
	Now listening on: http://[::]:80
	Application started. Press Ctrl+C to shut down.

Open your browser and go to `http://localhost:8000/api/values` to see it working. You should get the following HTTP 200 OK response:

[
		"value1",
		"value2"
]

# JMeter
We are going to test the .Net Core Web Api application running JMeter test in a Docker Container

## Build Jmeter image
We are going to build a docker image with the dependencies required to run JMeter

## Create simple test
We are going to show how to create some simple JMeter test 

## Run tests
Run the test from the Docker Jmeter Container
