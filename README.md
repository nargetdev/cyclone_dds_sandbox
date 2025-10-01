## CycloneDDS static peers example with tailscale

This was the only way i was able to get MacOS ros nodes communicating with raspberry pis on the LAN via DDS .. **docker port forwarding only and not using `--net host` which does not really exist on macos docker vm**

### Environment

i'm using `OrbStack` for the docker runtime.  Dont know if it matters.

---
# usage

    ./talknlisten.sh