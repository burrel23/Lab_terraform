terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

#pull image 

resource "docker_image" "nginx" {
  name = var.docker_image
}

#Create Container

resource "docker_container" "nginx_lab" {
    image = var.docker_image
    name  = "nginx_lab_${count.index}"
    memory = var.memory
    privileged = var.priviledged
    count = var.number_of_container
    ports {
      internal = var.port.inter
      external = var.port.ext + count.index
    }
}   