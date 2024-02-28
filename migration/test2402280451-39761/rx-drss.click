balancer :: DeviceBalancer(DEV fd0, METHOD "rss", VERBOSE 0, TIMER 500, CPUS $queuesNb, TARGET load, STARTCPU 1, LOAD 0.90, RETA_SIZE 512 , MANAGER manager, MARK true);


StaticThreadSched(balancer -2)
StaticThreadSched(a -1);


fd0


