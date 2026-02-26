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

---

_*Documentation by: Raymond C. Turner*_

_*Date: February 26th, 2026*_
