# JMeter 

## Create JMeter test
    In this [slides](https://slides.com/jecaestevez/docker-with-dotnet-core-and-jmeter/live#/3/4) it's shown how to create simple Jmeter test
    The test created in this example has been parametriced to have configurable the host name url and the port

## Run JMeter test
In order to run JMeter test with a now GUI it should be execute Jmeter like this:

> jmeter  -n -t /cloneRepoPath/Jmeter/TestPlan.jmx -j /cloneRepoPath/Jmeter/TestPlan.log -l /cloneRepoPath/Jmeter/TestPlan.jtl -JSERVERNAME=heatmeterwebapi -JPORTNUMBER=80 

More information about Jmeter parameters in this [link](https://jmeter.apache.org/usermanual/get-started.html)

## Docker image
We are going to use the docker image from [vmarrazzo](https://hub.docker.com/r/vmarrazzo/jmeter)

In this example we are going to overwritte the entrypoint :
> entrypoint: jmeter  -n -t /mnt/jmeter/Jmeter/TestPlan.jmx -j /mnt/jmeter/Jmeter/TestPlan.log -l /mnt/jmeter/Jmeter/TestPlan.jtl -JSERVERNAME=heatmeterwebapi -JPORTNUMBER=80 


