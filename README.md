To install Docker on Ubuntu 22.04, follow these steps:

1. **Update your package list** to ensure you have the latest version of the package manager:
   ```
   sudo apt update
   ```

2. **Install prerequisite packages** to allow `apt` to use packages over HTTPS:
   ```
   sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
   ```

3. **Add Docker’s official GPG key** to ensure the downloads are valid:
   ```
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```

4. **Set up the Docker repository** by adding the Docker repository to your system's software repository list. This is done by creating a new file in `/etc/apt/sources.list.d/` that contains the Docker repository details:
   ```
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

5. **Update your package list again** to include the Docker packages from the newly added repository:
   ```
   sudo apt update
   ```

6. **Install Docker Engine**:
   ```
   sudo apt install docker-ce docker-ce-cli containerd.io
   ```

7. **Verify the installation** by running the Docker hello-world image:
   ```
   sudo docker run hello-world
   ```

8. **(Optional) Post-installation steps**:
   - **To avoid using `sudo` when you run the `docker` command**, add your username to the `docker` group:
     ```
     sudo usermod -aG docker $USER
     ```
   - Log out and back in so that your group membership is re-evaluated, or type the following command:
     ```
     newgrp docker
     ```
   - Test your Docker installation by running the hello-world image again, but this time without `sudo`:
     ```
     docker run hello-world
     ```

These steps ensure you have the latest version of Docker installed on your Ubuntu 22.04 system, allowing you to start using Docker containers right away [0][1].

To kill the `hello-world` Docker container, you first need to identify the container's ID or name. You can list all running containers with the command:

```bash
docker container ls
```

Look for the `hello-world` container in the list. Once you have the container ID or name, you can use the `docker kill` command to stop the container. If you don't know the container ID or name, you can use the following command to find the container ID by filtering based on the image name:

```bash
docker ps --filter 'ancestor=hello-world' -q
```

This command lists the IDs of all running containers that were created from the `hello-world` image. Once you have the container ID, you can kill the container using:

```bash
docker kill <container_id>
```

Replace `<container_id>` with the actual ID of your `hello-world` container.

Alternatively, if you know the container name, you can directly use:

```bash
docker kill <container_name>
```

Replace `<container_name>` with the actual name of your `hello-world` container.

Remember, the `docker kill` command sends a `SIGKILL` signal to the container, which forcefully stops it. If you prefer a more graceful shutdown, you can use the `docker stop` command instead, which sends a `SIGTERM` signal and allows the container to shut down gracefully [0][1].
