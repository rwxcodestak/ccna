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


>Example of EtherChannel setup via the cli
>```cli
>ASW1'show etherchannel load-balance
>EtherChannel Load-Balancing Configuration:
>	src-dst-ip
>	
>EtherChannel Load-Balancing Address Used Per-Protocol:
>Non-IP: Source XOR Destination MAC address
>	IPv4: Source XOR Destination IP address
>	IPv6: Source XOR Destination IP address
>```

**Change the Load-balancing method**

>ASW1#conf t
>ASW1(config)#port-channel load-balance src-dst-mac
>ASW1(config)#do show etherchannel load-balance
>
>EtherChannel Load-Balancing Configuration:
>	src-dst-ip
>	
>EtherChannel Load-Balancing Address Used Per-Protocol:
>Non-IP: Source XOR Destination MAC address
>	IPv4: Source XOR Destination IP address
>	IPv6: Source XOR Destination IP address
>ASW1(config)#	


**The two important commands to remember**
```cli
SW# show etherchannel load-balance
SW(config)# port-channel load-balance *method*
```

## EtherChannel Protocols
- There are three methods of EtherChannel configuration on Cisco switches:
- PAgP (Port Aggregation Protocol)
	- Cisco proprietary protocol
	- Dynamicaly negotiates the creation/maintenance of the EtherChannel. (Like DTP does for trunks).
- LACP (Link Aggregation Control Protocol)
	- Industry standard protocol (IEEE 802.3ad)
	- Dynamicaly negotiates the creation/maintenance of the EtherChannel. (Like DTP does for trunks).
- Static EtherChannel
	- A protocol isn't used to determine if an EtherChannel should be formed.
	- Interfaces are statically configured to form an EtherChannel.
- Up to 8 interfaces can be formed into a single EtherChannel (LACP allows up to 16, but only 8 will be active, the other 8 will be in standby mode, waiting for an active interface to fail)

---

_*Documentation by: Raymond C. Turner*_

_*Date: March 1st, 2026*_
