student-04-cd6766edf25d@mc-server:/home/minecraft$ . backup.sh
No screen session found.
Copying file:///home/minecraft/world/level.dat [Content-Type=application/octet-stream]...
Copying file:///home/minecraft/world/session.lock [Content-Type=application/octet-stream]...
Copying file:///home/minecraft/world/region/r.-2.-1.mca [Content-Type=application/octet-stream]...
Copying file:///home/minecraft/world/region/r.-1.0.mca [Content-Type=application/octet-stream]...
- [4 files][  2.6 MiB/  2.6 MiB]
==> NOTE: You are performing a sequence of gsutil operations that may
run significantly faster if you instead use gsutil -m cp ... Please
see the -m section under "gsutil help options" for further information
about when gsutil -m can be advantageous.

Copying file:///home/minecraft/world/region/r.0.0.mca [Content-Type=application/octet-stream]...
Copying file:///home/minecraft/world/region/r.0.-1.mca [Content-Type=application/octet-stream]...
Copying file:///home/minecraft/world/region/r.-1.-1.mca [Content-Type=application/octet-stream]...
Copying file:///home/minecraft/world/region/r.-2.0.mca [Content-Type=application/octet-stream]...
Copying file:///home/minecraft/world/data/raids.dat [Content-Type=application/octet-stream]...
Copying file:///home/minecraft/world/DIM-1/data/raids_nether.dat [Content-Type=application/octet-stream]...
Copying file:///home/minecraft/world/DIM1/data/raids_end.dat [Content-Type=application/octet-stream]...
\ [11 files][  3.4 MiB/  3.4 MiB]
Operation completed over 11 objects/3.4 MiB.
No screen session found.



student-04-cd6766edf25d@mc-server:/home/minecraft$ cat backup.sh
#!/bin/bash
YOUR_BUCKET_NAME="bharathdasara123"
screen -r mcs -X stuff '/save-all\n/save-off\n'
/usr/bin/gsutil cp -R /home/minecraft/world gs://${YOUR_BUCKET_NAME}-minecraft-backup/$(date "+%Y%m%d-%H%M%S")-world
screen -r mcs -X stuff '/save-on\n'
student-04-cd6766edf25d@mc-server:/home/minecraft$