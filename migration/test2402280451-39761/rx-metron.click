balancer :: DeviceBalancer(DEV fd0, METHOD "metron", CONFIG $RULES, CPUS $queuesNb, VERBOSE 0, TARGET load, STARTCPU -1, UNDERLOAD 0.35, OVERLOAD 0.65, AUTOSCALE false, CYCLES cycles, MIN_MOVEMENT $MINMVMT, TIMER 500, ACTIVE true);

StaticThreadSched(balancer -2)

fd0

