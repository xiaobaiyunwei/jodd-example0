package jodd.example;

import jodd.joy.core.DefaultAppCore;
import jodd.joy.core.DefaultWebApplication;

public class AppWebAplication extends DefaultWebApplication {
    @Override
    protected DefaultAppCore createAppCore() {
        return new AppCore();
    }
}