package jodd.example;

import jodd.joy.core.DefaultAppCore;
import jodd.log.Logger;
import jodd.log.LoggerFactory;
import jodd.log.impl.SimpleLoggerFactory;

public class AppCore extends DefaultAppCore {
    @Override
    protected void initLogger() {
        LoggerFactory.setLoggerFactory(new SimpleLoggerFactory(Logger.Level.DEBUG));
        super.initLogger();
    }
}