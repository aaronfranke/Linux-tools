
#!/bin/bash

if ![ -f /usr/bin/google-chrome-stable ]; then
    echo "Google Chrome is not installed. Please install Google Chrome. "
    exit 1
fi

"/usr/bin/google-chrome-stable" %U --kiosk https://www.netflix.com






