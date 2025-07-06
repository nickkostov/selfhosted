# selfhosted
Selfhosted Things



**k3s** is a lightweight Kubernetes distribution developed by Rancher, designed for resource-constrained environments like edge computing, IoT devices, and development setups.

### Key Features:
- **Single binary** under 100 MB
- **Minimal dependencies** and easy to install
- Built-in components like **containerd**, **flannel**, and **etcd** (optional)
- Optimized for **ARM** and **x86** architectures
- Suitable for **edge, CI, development**, and **small production** clusters

In summary, k3s provides a simplified and efficient Kubernetes experience with low overhead.

**MetalLB** is a load-balancer implementation for bare-metal Kubernetes clusters. Unlike cloud environments that offer built-in load balancers, bare-metal setups need an external solution—**MetalLB fills that gap**.

### Key Features:
- Implements **LoadBalancer** service type in bare-metal environments
- Supports two modes:
  - **Layer 2 (ARP/NDP)**: Uses ARP to announce IPs on the local network
  - **BGP**: Advertises routes to network peers via BGP protocol
- Easy to deploy and configure
- Works seamlessly with **k3s**, **kubeadm**, and other Kubernetes distributions

In summary, MetalLB lets you use standard Kubernetes load balancer services on non-cloud infrastructure.

**ARP** stands for **Address Resolution Protocol**. It's a network protocol used to map an **IP address** to a **MAC address** on a local area network (LAN).

### How ARP Works:
1. A device wants to send data to an IP (e.g., 192.168.1.10).
2. It checks its ARP table for the corresponding MAC address.
3. If not found, it broadcasts an **ARP request**: "Who has 192.168.1.10?"
4. The device with that IP responds with its MAC address.
5. The sender saves the info and uses the MAC to send Ethernet frames.

### In the Context of MetalLB:
- In **Layer 2 mode**, MetalLB uses ARP to tell the local network:  
  "**This IP belongs to me**," so traffic to that IP gets routed to the Kubernetes service.

In short, ARP is how devices on a LAN find each other’s hardware addresses to communicate.

**BGP** stands for **Border Gateway Protocol**. It's a standardized routing protocol used to exchange routing information between different networks, primarily on the internet—but also in private networks.

### Key Concepts:
- **Exterior Gateway Protocol**: Used to connect separate networks (Autonomous Systems or ASes)
- Determines the **best path** for data to travel across networks
- Core protocol that powers **global internet routing**

### In the Context of MetalLB:
- In **BGP mode**, MetalLB **advertises service IPs** to external routers.
- This allows traffic to Kubernetes services to be routed through the **BGP peer** directly, instead of relying on ARP.
- More scalable and suitable for **production-grade, multi-node, and high-performance networks**

### Benefits of BGP Mode in MetalLB:
- Works well with enterprise routers and firewalls
- Allows for **redundancy and high availability**
- Suitable for **large or complex network topologies**

In summary, BGP in MetalLB is a powerful alternative to ARP-based routing for integrating Kubernetes with existing network infrastructure.
