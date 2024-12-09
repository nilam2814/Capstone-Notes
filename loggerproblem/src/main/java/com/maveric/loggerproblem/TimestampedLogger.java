package com.maveric.loggerproblem;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimestampedLogger implements EnhancedLogger {
    private final ILogger logger;

    public TimestampedLogger(ILogger logger) {
        this.logger = logger;
    }

    @Override
    public void info(String msg) {
        String logMessage = getCurrentTimestamp() + " Info-" + msg;
        logger.info(logMessage);
    }

    @Override
    public void error(String msg) {
        String logMessage = getCurrentTimestamp() + " Error-" + msg;
        logger.error(logMessage);
    }

    private String getCurrentTimestamp() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(new Date());
    }
}

