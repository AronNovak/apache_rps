ma <- function(x,n=5){filter(x,rep(1/n,n), sides=1)}
max_clients <- 50;

rps <- read.csv(file="rps_may31.csv", head=TRUE, sep=",");
a <- ma(rps$requests_per_second, 5);

png(filename="rps-may-31.png", width=800, height=600, units="px", pointsize = 12);

plot(rps$requests_per_second, col="darkblue", xlab="Time", ylab="Requests", xaxt="n", type="h");
a <- ma(rps$requests_per_second, 5);
lines(a, col="green", type="h");
a <- ma(rps$requests_per_second, 60);
lines(a, col="red", type="h");
a <- ma(rps$requests_per_second, 3600);
lines(a, col="yellow", type="h");
legend("topleft", c("Per second", "Per 5 seconds", "Per minute", "Per hour"), col=c("darkblue", "green", "red", "yellow"), lty=1, lwd=2);

hours <- rps$date[seq(1, length(rps$date), 3600)];
axis(1, at=seq(0, 3600*23, 3600), hours);

abline(max_clients, 0);
dev.off();
