# 2-Tier Kubernetes Application

This project deploys a simple 2-tier application (frontend + backend) on Kubernetes using Helm manifests. It includes key optimizations for performance, cost, and reliability.

---

## Architecture Overview

- **Frontend:** Node.js app running on port 3000.
- **Backend:** Python HTTP server running on port 5000.
- Both components are deployed with Kubernetes Deployments and exposed internally via Services.
- Horizontal Pod Autoscaler (HPA) scales backend pods based on CPU usage.

---

## Optimization Strategies

### 1. Resource Requests & Limits

- Both frontend and backend containers specify CPU and memory requests and limits.
- **Purpose:** Controls pod resource consumption to ensure cluster stability and efficient bin-packing.
- **Cost Implication:** Prevents over-provisioning (wasting resources) and under-provisioning (causing OOM kills or throttling).

### 2. Liveness and Readiness Probes

- **Liveness Probes:** Detect if a pod is unhealthy and restart it.
- **Readiness Probes:** Control traffic routing; only route requests to healthy pods.
- Using HTTP GET probes on the main application path with reasonable initial delays and check intervals.
- **Performance Impact:** Improves availability and resilience by detecting failures quickly without false positives.

### 3. Horizontal Pod Autoscaler (HPA)

- Autoscaling based on CPU usage (target 50%).
- Configured minimum and maximum pod counts (e.g., min 2, max 5).
- **Benefit:** Dynamically adjusts capacity to handle variable load, improving cost-efficiency and user experience.
- HPA setup requires Metrics Server to provide resource usage data.

### 4. Image Selection and Container Startup

- Use lightweight base images (e.g., `node:alpine`) to reduce container startup time and image size.
- Smaller images reduce network bandwidth usage during image pulls and speed up scaling events.

### 5. Performance Tips for Backend

- Backend service notes suggest adding a caching layer for frequent read operations to reduce response latency and CPU load.

### 6. Cost and Performance Balance

- Resource limits and autoscaling thresholds are tuned to balance cost and performance:
  - Avoids running excess pods under low load (cost saving).
  - Prevents resource starvation under high load (performance guarantee).

---

## Scaling Demonstration

- Using `kubectl top pods` and `kubectl get hpa` to monitor CPU usage and pod scaling.
- Load simulated using internal pod hitting backend service continuously.
- Autoscaling triggered once CPU usage exceeds 50%.

---

## Why are liveness and readiness probes critical in keeping a product’s user experience stable and reliable?
1. Liveness probes help Kubernetes detect when an application instance (pod) has crashed or entered a broken state where it cannot recover. Kubernetes will restart the unhealthy pod automatically, minimizing downtime.

2. Readiness probes tell Kubernetes whether a pod is ready to serve traffic. Pods that fail readiness checks are temporarily removed from the service load balancer, preventing users from hitting partially initialized or unhealthy pods.


## How does Horizontal Pod Autoscaler (HPA) help in handling flash sales, seasonal load spikes, or traffic surges in real-world applications like an e-commerce platform?
HPA automatically scales the number of pod replicas based on observed resource usage metrics like CPU or memory. During traffic surges (e.g., flash sales, seasonal spikes), HPA detects increased CPU load and spins up additional pods to distribute workload and maintain performance. 
When load decreases, HPA scales down pods to save cost, ensuring efficient resource utilization.
