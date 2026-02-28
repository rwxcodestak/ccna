# CCNA Networking Studies 2026

## STP and RSTP
    - Portfast
    - BPDU
    - Loop Guard
    - BPDU Guard
    - Root Guard
    - RTSP Lab
    - PVSTP
    - Port Priority
    - Redundancy
    - Forwarding
    - PVST+
    - Blocking
    - Designated
    - Alternate
    - Root Cost
    - Bridge Priority
    - Broadcast Storms
    - Port Priority
    - Port roles
    - Link types
    - Collision Domains
    - Shared Collision Domain

## EtherChannel
    - Configuring Layer 2/Layer 3 EtherChannels
        - ASW1 - Access layer switch
        - DSW1 - Distributed layer switch
> When the bandwidth of the interfaces connected to the end hosts is greater than the bandwidth of the connection to the distribution switch(es), this is called **over-subscription**. Some over-subscription is acceptable, but to much will cause congestion.

- If you connect two switches together with multiple links, all except one will be disabled by spanning tree.
- If all of ASW1's interfaces were forwarding, Layer 2 loops would form between ASW1 and DSW1's, leading to broadcast storms.
- Other links will be used unless the active link fails. In that case, one of the inactive links will start forwarding.
- EtherChannel groups multiple interfaces together to act as a single interface
- STP will treat this group as a single interface.

>Traffic using the EtherChannel will be load balanced among the physical interfaces in the group. An algorithm will determine which traffic will use which physical interface.

- Some other names for an EtherChannel are:
	- Port Channel
	- LAG (Link Aggregation Group)

## EtherChannel Load-Balancing

- EtherChannel load balances based on 'flows'.
- A flow is a communication between two nodes in the network.
- Frames in the same flow will be forwarded using the same physical interface.
- If frames in the same flow were forwarded using different physical interfaces, some frames may arrive at the destination out of order, which can cause problems.
- you can change the inputs used in the interfaces selection calculation.
- Inputs that can be used:
	- Source MAC
	- Destination MAC
	- Source AND Destination MAC
	- Source IP
	- Destination IP
	- Source AND Destination IP

---

_*Documentation by: Raymond C. Turner*_

_*Date: February 28th, 2026*_
