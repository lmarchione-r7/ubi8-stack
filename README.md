# amazonlinux Base Stack

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
* Python, go, nodejs, and likely other buildpacks only support bionic and jammy-based stacks at present.
    * This stack can be used to test and validate support for other stacks.
