
Step 1: Create the HTML file

Create a file named `index.html` with the following content:

```html
<!DOCTYPE html>
<html>
<head>
    <title>My Simple Docker Web Page</title>
</head>
<body>
    <h1>Hello, Docker!</h1>
    <p>This is a simple Docker container serving a static HTML page.</p>
</body>
</html>
```

Step 2: Create the Dockerfile

Create a file named `Dockerfile` (no file extension) with the following content:

```Dockerfile
# Use the official NGINX base image
FROM nginx

# Copy the index.html file into the NGINX html directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 (the default port for NGINX)
EXPOSE 80
```

Step 3: Build the Docker image

Open a terminal or command prompt in the directory where your `Dockerfile` and `index.html` are located. Then, run the following command to build the Docker image:

```bash
docker build -t simple .
```

The `docker build` command reads the `Dockerfile` and creates an image named `simple` using the current directory as the build context. The `-t` flag tags the image with the name "simple."

Step 4: Run the Docker container

Now that you have the Docker image, you can run a container based on it. Use the following command:

```bash
docker container run --name my_simple_docker -d -p 9000:80 simple
```

Explanation of the command:
- `--name my_simple_docker`: This assigns the name "my_simple_docker" to the running container. You can replace "my_simple_docker" with any name you prefer.
- `-d`: This flag runs the container in detached mode, which means it runs in the background.
- `-p 9000:80`: This maps port 9000 on the host to port 80 inside the container. So, you can access the web page served by the container at `http://localhost:9000` in your web browser.

Step 5: Access the web page

With the container running, open your web browser and go to `http://localhost:9000`. You should see the simple web page with the "Hello, Docker!" message.

Step 6: Stop the container

To stop the running container, you can use the following command:

```bash
docker container stop my_simple_docker
```

Replace "my_simple_docker" with the name you used when running the container.

And the following command is to restart it

```bash
docker container start my_simple_docker
```


That's it! You have successfully created a simple Docker image with an HTML file and ran it as a container using NGINX. Feel free to modify the `index.html` file or the `Dockerfile` to experiment with different web content and configurations.