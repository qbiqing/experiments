pqos -m "all:0-15" -i 2 -o test.log &
start=$(date "+%s.%N")
while true; do
    sleep 0.2
    now=$(date "+%s.%N")
    t=$(echo "$now-$start" | bc)
    cat test.log | awk '{if($1!="TIME") print $2;}' | awk '{if($1!="IPC") print $1;}' | awk '{ total +=$1;count++} END{print "pqos-'$t'-RESULT-IPC " total/count}'
    cat test.log | awk '{if($1!="TIME") print $3;}' | awk '{if($1!="MISSES") print $1;}' | awk '{ total +=$1;count++} END{print "pqos-'$t'-RESULT-LLCMISSES " total/count" k"}'
    cat test.log | awk '{if($1!="TIME") print $4;}' | awk '{if($1!="LLC[KB]") print $1;}' | awk '{ total +=$1;count++} END{print "pqos-'$t'-RESULT-LLC-OCCUPANCY " total/count" KB"}'
    cat test.log | awk '{if($1!="TIME") print $5;}' | awk '{if($1!="MBL[MB/s]") print $1;}' | awk '{ total +=$1;count++} END{print "pqos-'$t'-RESULT-MBL " total/count" MB/s"}'
    cat test.log | awk '{if($1!="TIME") print $6;}' | awk '{if($1!="MBR[MB/s]") print $1;}' | awk '{ total +=$1;count++} END{print "pqos-'$t'-RESULT-MBR " total/count" MB/s"}'
    > test.log
done

// ---------------------- MAIN CLICK SCRIPT -------------------------
// At the processing machine, we always run a simple RSS-based receiver
