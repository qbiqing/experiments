balancer :: DeviceBalancer(DEV fd0, METHOD "rss", VERBOSE 0, TIMER 500, CPUS $queuesNb, TARGET load, STARTCPU -1, LOAD 0.90, RSSCOUNTER agg, AUTOSCALE false, CYCLES cycles, RETA_SIZE 512, IMBALANCE_THRESHOLD 0.02, DANCER 0, ACTIVE true, NUMA 0 , MANAGER manager, MARK true, GROUP true ); //VERIFIER RSS


StaticThreadSched(balancer -2)
/*
//For RSS video
a :: Script(
    TYPE ACTIVE,
    set RUNNING 1,
    // Show queue statistics only if the flag is set to 1
    set start $(now),
    set lasttime $start,
    set t 0.1,
    set h 0.2,
    label loop,
    print "Wait for $t sec",
    wait $t,
    set time $(now),
    set difftime $(sub $time $start),
    print "Writing stats for $difftime...",
    write agg.write_text_file "AGG-$difftime.txt",
    set t $(sub $h $difftime),
    set h $(add $h 0.1),
    set lasttime $time,
    goto loop $(eq $RUNNING 1),
);
*/
StaticThreadSched(a -1);


fd0
//    -> rss :: RSSVerifier(MASK 511, CPU 15)
      -> agg :: AggregateCounterVector(MASK 511 , MARK true)

