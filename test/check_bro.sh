#/bin/bash

BRO_HOME="/opt/bro"

$BRO_HOME/bin/bro -C -r test.pcap
NUM_LINES=`wc -l conn.log | awk '{print $1}'`
EXP=17

if [ -e conn.log -a "$NUM_LINES" -ne "$EXP" ]; then
  echo "FAILED!"
  exit 1
fi

rm *.log
rm -r .state
echo "Passed!"
