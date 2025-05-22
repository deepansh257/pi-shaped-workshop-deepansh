# Docker Image Link
## https://hub.docker.com/repository/docker/deepansh257/hello-world-docker-basics/general

# Core Concept Questions

## Why do we set requests and limits for CPU/memory in a production-grade product?
**Stability & Resource Management**: Requests outline a container's minimum guaranteed CPU/memory. This is how Kubernetes determines whether a node can run the pod without using too many resources.

**Effective Scheduling**: In order to balance workloads throughout the cluster, the scheduler uses requests to position pods on nodes with sufficient resources.

**Prevent the Depletion of Resources**: Limits prevent a single container from using up too much CPU or memory on the node, which could lead to crashes or decreased performance.

**Consistent Performance**: Guarantees that programs receive the resources required to function reliably and smoothly under load.

**Cost Management**:Helps maximise the use of infrastructure, particularly in cloud environments where resources are directly translated into

## When would a product team apply node affinity in Kubernetes?
**Features and Hardware Requirements**: When specialised hardware, such as GPUs, SSD storage, or nodes with particular network configurations, is needed for the application.

**Isolation of Workload**: To deploy pods exclusively on specific nodes in order to isolate workloads for organisational, security, or compliance reasons.

**Enhancement of Performance**: Ensuring high-performance nodes are used by latency-sensitive apps in order to fulfil SLAs.

**Separation of Teams and Multiple Tenancies**: When multiple teams wish to divide workloads across distinct nodes while sharing a cluster.

**Location of the Data**: When pods ought to operate in close proximity to data storage (for instance, on nodes that have particular persistent volumes connected).

**Cost-effectiveness**: To allocate critical workloads to premium nodes and non-essential workloads to less expensive or spot instances.


## Why is Docker useful in building and deploying microservices for a real-world product (like an e-commerce or banking app)?

E-Commerce or Banking applications are built based on multiple microservices, eg. payment service, cart service, orders service and many more. As different teams would use different tech stacks (Java, Python, Javascript) it is important to ensure that all the applications work as intended. Docker solves following problems in the context of these applications:
1. It provides consistency across multiple environments
2. Docker contains everything that is needed to run the application
3. Faster build and deployment ensures faster time to market


## What is the difference between a Docker image and a container in the context of scaling a web application?

| Feature         | Docker Image                                                  | Docker Container                                         |
|----------------|---------------------------------------------------------------|----------------------------------------------------------|
| **Definition**  | A read-only blueprint that defines what your app needs to run. Think of it like a snapshot of the code, OS, libraries, and dependencies. | A **live, running instance** of that image. It's the actual execution of your app using that blueprint. |
| **Analogy**     | Like a class in object-oriented programming (OOP). It's just a definition. | Like an object created from that class. It's doing real work. |
| **Use in Scaling** | You can use one image to spin up as many containers as needed. Perfect for scaling horizontally (e.g., handling more user traffic). | Each container is a separate instance (like a clone) based on that image. |
| **Storage**     | Stored as a file or snapshot (locally or on Docker Hub). It doesn't run by itself. | Runs in memory with allocated resources like CPU & RAM. It's active and doing its job. |


## How does Kubernetes complement Docker when running a product at scale (e.g., hundreds of containers)?

Kubernetes helps us with following features to complement docker
1. Scaling: Auto scales services based on CPU, memory, etc.
2. Load balancing: Distributes traffic based on resources
3. Self restarts: It restarts failing containers automatically
4. Management: Starts, stops, and manages containers across clusters