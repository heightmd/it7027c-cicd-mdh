# Code modified from examples found at the following documentation sites:
#
#https://registry.terraform.io/providers/docker/docker/latest/docs
#https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/network
#https://hub.docker.com/_/postgres
#https://docs.docker.com/engine/network/
#https://docs.docker.com/engine/network/drivers/bridge/

terraform {
	required_providers {
		docker = {
			source = "kreuzwerker/docker"
			version = "~> 3.0"
		}
	}
}

provider "docker" {}

# brings down the nginx demo image
resource "docker_image" "image_nginx" {
	name = "nginxdemos/hello:latest"
}



# creates container for nginx - adds both public and private networks
resource "docker_container" "nginx_contain" {
	name = "nginx"
	image = docker_image.image_nginx.image_id
	
}

