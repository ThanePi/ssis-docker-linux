# ssis-docker-linux

https://hub.docker.com/r/thanepi/ssis-docker-linux

This image of Docker is containing Microsoft SQL Server Integration Services individually installed on Ubuntu 20.04 as a Linux OS,

The purpose is for experimenting in the execution of 'Data Transformation Services Package XML' (.dtsx) files, which will continue implementing with a UNIX-based job scheduler platform. A ".dtsx" file didn't being generated here, but using a file from another machine or pre-generate from SSIS on Microsoft Visual Studio.

After setup, You can use its command "dtexec /F ...." from a terminal as normally. Or mounting a directory folder with 'Docker-Compose' is also a smart idea.
