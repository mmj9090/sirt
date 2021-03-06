## File Name: lsem_bootstrap_draw_bootstrap_sample.R
## File Version: 0.052

lsem_bootstrap_draw_bootstrap_sample <- function(data, sampling_weights,
    lsem_args, cluster=NULL)
{
    lsem_args1 <- lsem_args
    N <- nrow(data)
    if (is.null(cluster)){
        ind <- sample(1:N, N, replace=TRUE)
    } else {
        cluster1 <- data[,cluster]
        t1 <- unique(cluster1)
        N <- length(t1)
        ind0 <- sort(sample(t1, size=N, replace=TRUE))
        ind <- NULL
        for (nn in 1L:N){
            v1 <- which(cluster1==ind0[nn])
            ind <- c(ind, v1)
        }
    }
    lsem_args1$data <- data[ind,]
    lsem_args1$sampling_weights <- sampling_weights[ind]
    return(lsem_args1)
}
