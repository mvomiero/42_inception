### Useful commands


#### ssh to copy to the VM

* `hostname -I` , pick the first
* connect from the host with 
`ssh user@ip -p 4242`
* to copy a folder with ssh
`scp -r -P 4242 my_folder osboxes@10.15.247.178:/home/osboxes/`

#### docker commands

```
docker exec -it containername bash
```
_to access bash of the corresponding container_



# General concepts:

### Virtual Machine (VM)
A virtual machine is an emulation of a computer system that operates on top of a physical host machine. It creates a separate virtual environment with its own operating system (OS) and resources, isolated from the host and other VMs. The pros of VMs are strong isolation and compatibility, allowing you to run different OSes on the same host. However, VMs are resource-heavy and have slower startup times due to booting a full OS for each instance.

### Container
A container is a lightweight and portable package that includes the application code, runtime, libraries, and dependencies. Containers run on a shared operating system kernel, which makes them more efficient and faster to start compared to VMs. Containers offer excellent scalability and resource utilization. However, they have less isolation compared to VMs since they share the host OS.

### Docker
Docker is a popular platform that simplifies the process of creating, deploying, and managing containers. It uses containerization technology to package applications and their dependencies into containers. Docker provides a simple command-line interface and tools to build, ship, and run containers.

### Docker vs. Docker Compose
Docker is a containerization platform, whereas Docker Compose is a tool that simplifies the management of multi-container Docker applications. Docker allows you to work with individual containers, while Docker Compose lets you define a multi-container application stack using a YAML file. Compose simplifies orchestration, making it easier to manage complex applications with interconnected services.

### VM vs Containers
In summary, virtual machines offer strong isolation and compatibility but are resource-heavy. Containers, on the other hand, provide lightweight, efficient, and scalable solutions with a bit less isolation. Docker facilitates container management, and Docker Compose streamlines the management of multi-container applications. Each technology serves different use cases, and the choice between VMs and containers depends on factors such as resource requirements, isolation needs, and portability.

# Project

## Nginx

#### Dockerfile

The Dockerfile sets up a container with Nginx, installs OpenSSL to generate a self-signed SSL certificate, copies a custom Nginx configuration file, and exposes port 443 for HTTPS traffic. The Nginx server will be started in the foreground to serve the content over HTTPS on port 443. The self-signed certificate is not suitable for production use, and it's recommended to use a valid SSL certificate from a trusted certificate authority for secure and encrypted communication in production environments, but it's fine just for testing purpose.

#### nginx.conf

The nginx.conf file configures an Nginx server to handle HTTPS traffic on port 443 with SSL/TLS encryption. It specifies a domain name (mvomiero.42.fr) and points to SSL certificate and key files. The server is set to serve static files from the /var/www/html directory and process PHP files via a FastCGI server listening at wordpress:9000. It also specifies the default index files to try and defines some FastCGI parameters for PHP handling.

##### FastCGI
FastCGI (Fast Common Gateway Interface) is a protocol designed to improve the performance and efficiency of CGI (Common Gateway Interface) scripts in web servers. CGI is a standard method for web servers to interact with external programs to process dynamic content and generate HTML pages.

## Wordpress

#### Dockerfile

Installs extensions and runs the script.

#### Script

 this script installs necessary tools, downloads and configures WordPress, sets up the database, and starts PHP-FPM to serve the WordPress application.

## MariaDB

#### Dockerfile

Installs extensions and runs the script.

#### Script

Configuration of mysql

