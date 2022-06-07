#/bin/bash

$ZEEK_HOME/bin/zeek -C -r test.pcap
if [ $? -ne 0 ]; then
  echo "Error running Zeek!"
  exit 1
fi
NUM_LINES=`wc -l conn.log | awk '{print $1}'`
EXP=17

if [ -e conn.log -a "$NUM_LINES" -ne "$EXP" ]; then
  echo "FAILED!"
  exit 1
fi

# Cleanup junk files
rm -rf *.log .state
echo "Passed!"
