# amazonlinux Base Stack

docker hub image URIs:
* `jericop/amazonlinux-build:base`
    * Base build image **without** cloud native buildpacks user or environment variables
* `jericop/amazonlinux-build:base-cnb`
    * Base build image **with** cloud native buildpacks user and environment variables
* `jericop/amazonlinux-run:base`
    * Base run image **without** cloud native buildpacks user or environment variables
* `jericop/amazonlinux-run:base-cnb`
    * Base run image **with** cloud native buildpacks user and environment variables
    

## What is a stack?
See Paketo's [stacks documentation](https://paketo.io/docs/concepts/stacks/).

## What is this stack for?
Ideal for:
- Java apps
- Apps that require some C libraries

## What's in the build and run images of this stack?
This stack's build and run images are based on amazonlinux:2.

## What buildpacks support this stack?
* The paketo [java](https://github.com/paketo-buildpacks/java) buildpack supports this stack out-of-the box.
    * This is because the individual java-based buildpacks support any stack
* The paketo [python](https://github.com/paketo-buildpacks/python) buildpack supports this stack out-of-the box.
    * This is because the individual python-based buildpacks support any stack
    * See: https://github.com/paketo-buildpacks/python/issues/522
* Support for go is forthcoming.
    * See: https://github.com/paketo-buildpacks/go/issues/666
* Nodejs and likely other buildpacks only support bionic and jammy-based stacks at present.
    * This stack can be used to test and validate support for other stacks.

# PLEASE NOTE

* This stack is intended for testing purposes only.
* It is not updated regularly and therefore may have security vulnerabilities.
* Please use the paketo stacks and builders for production workloads.
* Or you can build your own stack (like this) and ensure it is regularly updated/rebuilt for security updates.

