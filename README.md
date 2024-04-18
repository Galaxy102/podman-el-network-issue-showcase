# Podman Enterprise Linux Network Error Showcase

I had a random connection issue in Podman containers which affected only Enterprise Linux installations. Sometimes, I was unable to connect to another totally unrelated host (even google.com).
Upon further inspection I could see broken TCP communication while handshaking: `SYN`, `SYN-ACK`, but no `ACK`:  
![clipboard-202404172006-zrqti](https://github.com/Galaxy102/podman-el-network-issue-showcase/assets/18245993/cdc1f1dc-6d15-41f5-b2b8-1b9c59459cfe)

This issue only affects communication under the following circumstances:
- You use **Enterprise Linux** (Alma, Rocky, RHEL)
- You have two bridge networks, net0 and net1 (name arbitrary)
- You have one container on net0 which publishes ports
- You have a second container on net0 and net1
- The issue occurs for any outbound communication that leaves on the network interface corresponding to net0 (this is a random component - sometime the packets leave on one interface, sometimes on the other one!)

This scenario can be set up with `vagrant up rocky93`. The other VMs are included for reference/testing purposes, I can confirm that `openSUSE`, `Fedora` and `Ubuntu` work as-is.

After some time you should see the result of the test stage:  
![image](https://github.com/Galaxy102/podman-el-network-issue-showcase/assets/18245993/119d84a5-2583-4a71-a644-a68986593571)

It is clear that communication works on one interface, but not the other one. Because of [containers/podman#12850](https://github.com/containers/podman/issues/12850), the affected interface name may differ.

After comparing the `sysctl`s of Rocky 9.3 and Ubuntu 23.10, I was able to isolate a few interesting differences. After a bit of trial-and-error I was able to boil it down to `net.ipv4.conf.default.rp_filter`, which is set to `1` in Enterprise Linux and `2` in Ubuntu.
This `sysctl` basically tells the kernel to drop any communication for which the packet's path is suboptimal (as far as I understood RFC3704 from a few minutes of reading) if `1` is set or allow it if by any chance this packet may be legitimate if `2` is set.
The value `0` disables any path checks.

Now if you uncomment line 4 of [the VM setup script](scripts/os-prep/rocky93.sh) and run `vagrant provision rocky93`, you will see everything works as expected:  
![image](https://github.com/Galaxy102/podman-el-network-issue-showcase/assets/18245993/4260dad8-e7b3-4ee1-a69a-e31d45605fb5)
