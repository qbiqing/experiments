echo "Launching perf"
start=$(date "+%s.%N")
while true; do
    now=$(date "+%s.%N")
    t=$(echo "$now-$start" | bc)
    ~/workspace/linux-5.1/tools/perf/perf stat -e cycles,instructions,cache-references,cache-misses,cpu-migrations,bus-cycles,L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -a --cpu 0-15 sleep 0.2 &> perf.out
    cat perf.out | grep "LLC-loads" | awk '{ gsub(",","",$1); print "perf-'$t'-RESULT-LLC-LOADS "$1}'
done

//Script to call PQOS to get LLC misses and other events
