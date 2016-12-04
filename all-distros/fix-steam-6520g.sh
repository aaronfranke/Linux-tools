
#!/bin/bash

cd "$HOME/.steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu"

mv libstdc++.so.6 libstdc++.so.6.bak

cd "$HOME/.steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu"

mv libstdc++.so.6 libstdc++.so.6.bak

echo " " 
echo "Steam has been fixed! "
echo " " 



