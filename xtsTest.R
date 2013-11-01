options(width=250)

# TODO: Fails with EST
TZ <- "EST"
# TODO: Works with UTC
#TZ <- "UTC"

Sys.setenv(TZ=TZ)

require(blotter)

symbol <- "SPY"

SPY <- getSymbols(symbol, from="1990-01-01", auto.assign=FALSE)
SPY.test <- adjustOHLC(SPY)

head(SPY.test)

SPY.test$duplication <- .xts((-1)*coredata(SPY.test)[, 1], index(SPY.test), tzone=TZ)

# ERROR: Duplicated rows with TZ <- "EST" but all is fine with TZ <- "UTC"... Why!!!???
head(SPY.test)
