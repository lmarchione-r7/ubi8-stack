variable "GIT_REPO" {
    default = "https://github.com/lmarchione-r7/amazonlinux-stack"
}

variable "MAINTAINER" {
    default = "lmarchione-r7"
}

variable "BASE_IMAGE" {
    default = "redhat/ubi8:8.6-990"
}

variable "IMAGE_NAME_PREFIX" {
    default = "lmarchione737/ubi8"
}

variable "DESCRIPTION" {
    default = "Image based on ${BASE_IMAGE}"
}


variable "STACK_METADATA" {
    default = ""
}

variable "MIXINS" {
    default = ""
}

variable "RELEASED" {
    default = ""
}

variable "PACKAGE_METADATA" {
    default = ""
}

target "_common" {
  args = {
    GIT_REPO            = GIT_REPO
    MAINTAINER          = MAINTAINER
    BASE_IMAGE          = BASE_IMAGE
  }
}

target "_stack_info" {
  args = {
    description         = DESCRIPTION
    metadata            = STACK_METADATA
    mixins              = MIXINS
    released            = RELEASED
    package_metadata    = PACKAGE_METADATA
    maintainer          = MAINTAINER
  }
}

// Bake builds this by default
group "default" {
    targets = [
        "base",
    ]
}

// base stack (with minimal build and run time packages installed)
group "base" {
    targets = [
        "run-base",
        "run-base-cnb",
        "build-base",
        "build-base-cnb",
    ]
}

target "run-base" {
    inherits = ["_common"]
    context = "./docker"
    dockerfile = "Dockerfile"
    target = "run-base"
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
    tags = [
        "${IMAGE_NAME_PREFIX}-run:base",
    ]
}

target "run-base-cnb" {
    inherits = ["_common", "_stack_info"]
    context = "./docker"
    dockerfile = "Dockerfile"
    target = "run-base-cnb"
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
    tags = [
        "${IMAGE_NAME_PREFIX}-run:base-cnb",
    ]
}

target "build-base" {
    inherits = ["_common"]
    context = "./docker"
    dockerfile = "Dockerfile"
    target = "build-base"
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
    tags = [
        "${IMAGE_NAME_PREFIX}-build:base",
    ]
}

target "build-base-cnb" {
    inherits = ["_common", "_stack_info"]
    context = "./docker"
    dockerfile = "Dockerfile"
    target = "build-base-cnb"
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
    tags = [
        "${IMAGE_NAME_PREFIX}-build:base-cnb",
    ]
}
