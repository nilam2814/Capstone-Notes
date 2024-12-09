package com.maveric.loggerproblem;

public class LoggerUsage {
    public static void main(String[] args) {
        ILogger logger = new LoggerImpl();
        EnhancedLogger enhancedLogger = new TimestampedLogger(logger);

        enhancedLogger.info("successful");
        enhancedLogger.error("something went wrong");
    }
}
