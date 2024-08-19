# Problem

Dockerfile for Sample Application: Create a Dockerfile for a sample application, ensuring lightweight images and adherence to best practices.

# Implementation

The sample app is an application picked from the internet to write the Dockerfile
The following steps were taken into consideration:

1. The base image chosen should be the leanest image to serve the purpose. As lesser the surface are lesser are the chances of vulnerabilities. I have chosen the latest official alpine based node image. Not using the latest tag but the latest available version tag
2. When choosing an existing image from dockerhub choose from the official images available.
3. Ordering of the instructions in the Dockerfile is important to take advantage of docker's caching capaabilities, which in turn reduces the build time. So instructions which have lesser chances of changing should come prior to what is susceptible to change.Clubbing multiple commands together could reduce the number of layers.
4. Using multistage build helps reduce the size of the image as it get rids of unnecessary layers for building and downloading dependencies.