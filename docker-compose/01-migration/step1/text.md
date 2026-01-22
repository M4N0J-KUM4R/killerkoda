# Step 1: From Chaos to Order

We want to run a **Shop** app connected to a **Redis** cache.

### Your Mission
1.  **The Hard Way** (Manual):
    First, create a network:
    ```bash
    docker network create shop-net
    ```{{exec}}
    Then run Redis:
    ```bash
    docker run -d --name redis-cache --network shop-net redis
    ```{{exec}}
    Then run the App:
    ```bash
    docker run -d --name shop-web --network shop-net -p 8080:80 \
      -e REDIS_HOST=redis-cache \
      nginx
    ```{{exec}}
    *This is tedious to type every time.*

2.  **Cleanup the Hard Way**:
    ```bash
    docker rm -f shop-web redis-cache
    # We keep the network for now, but usually you'd remove it too.
    ```{{exec}}

3.  **The Easy Way** (Compose):
    Create a `docker-compose.yml` file:
    ```yaml
    version: '3.8'
    services:
      redis-cache:
        image: redis
        networks:
          - shop-net
      
      shop-web:
        image: nginx
        ports:
          - "8080:80"
        environment:
          - REDIS_HOST=redis-cache
        depends_on:
          - redis-cache
        networks:
          - shop-net

    networks:
      shop-net:
    ```
    (Paste this content into `docker-compose.yml` or just run this to create it):
    ```bash
    cat <<EOF > docker-compose.yml
    version: '3.8'
    services:
      redis-cache:
        image: redis
        networks:
          - shop-net
      
      shop-web:
        image: nginx
        ports:
          - "8080:80"
        environment:
          - REDIS_HOST=redis-cache
        networks:
          - shop-net

    networks:
      shop-net:
    EOF
    ```{{exec}}

4.  **Launch**:
    ```bash
    docker compose up -d
    ```{{exec}}
    *Magic! Docker created the network, pulled images, and started both containers.*

5.  **Status**:
    ```bash
    docker compose ps
    ```{{exec}}
