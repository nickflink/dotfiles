#!/bin/bash
echo "fake_rsyncing $@"
RANDOMIZER=$RANDOM
let "RANDOMIZER %= 2"
sleep $RANDOMIZER
exit $RANDOMIZER
